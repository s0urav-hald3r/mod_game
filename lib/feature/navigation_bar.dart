import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/common/controllers/navigation_bar_controller.dart';
import 'package:mod_game/common/widgets/custom_appbar.dart';
import 'package:mod_game/feature/community/views/community.dart';
import 'package:mod_game/feature/download/views/download.dart';
import 'package:mod_game/feature/home/controllers/home_controller.dart';
import 'package:mod_game/feature/home/controllers/page_view_controller.dart';
import 'package:mod_game/feature/home/views/home.dart';
import 'package:mod_game/feature/search/views/search.dart';
import 'package:mod_game/utils/constants/colors.dart';
import 'package:mod_game/utils/constants/sizes.dart';
import 'package:mod_game/utils/helper/extension.dart';
import 'package:permission_handler/permission_handler.dart';

import '../common/widgets/custom_drawer.dart';
import '../utils/constants/icons.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final controller = NavigationBarController.instance;
  final _homeController = HomeController.instance;

  @override
  void initState() {
    super.initState();
    makeAPIs();
  }

  Future<void> makeAPIs() async {
    if (_homeController.mostTrendingMods.isEmpty) {
      await _homeController.getMostTrendingMods();
    }

    if (_homeController.recommendedMods.isEmpty) {
      await _homeController.getRecommendedMods();
    }

    PageViewController.instance.setModsForSlider();

    // ! Request for storage permission
    var permissionStatus = await Permission.storage.status;
    if (permissionStatus != PermissionStatus.granted) {
      permissionStatus = await Permission.storage.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: CustomAppBar(openDrawer: () => _key.currentState?.openDrawer()),
      drawer: const CustomDrawer(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Obx(() => _buildBody()),
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return [
      const HomeView(),
      const SearchView(),
      const CommunityView(),
      const DownloadView()
    ][controller.screenIndex];
  }

  Widget _buildBottomNavigationBar() {
    return CustomPaint(
      painter: BottomNavigationBarPainter(),
      child: ClipPath(
        clipper: BottomNavigationBarClipper(),
        child: Container(
          width: double.infinity,
          height: 70.h,
          color: XColor.darkerGrey,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavBarItem(
                icon: XIcon.navHomeIcon,
                selectedIcon: XIcon.navSelectHomeIcon,
                title: 'Home',
                index: 0,
              ),
              NavBarItem(
                icon: XIcon.navSearchIcon,
                selectedIcon: XIcon.navSelectSearchIcon,
                title: 'Search',
                index: 1,
              ),
              NavBarItem(
                icon: XIcon.navCommunityIcon,
                selectedIcon: XIcon.navSelectCommunityIcon,
                title: 'Community',
                index: 2,
              ),
              NavBarItem(
                icon: XIcon.navDownloadIcon,
                selectedIcon: XIcon.navSelectDownloadIcon,
                title: 'Download',
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String icon;
  final String selectedIcon;
  final String title;
  final int index;
  const NavBarItem(
      {super.key,
      required this.icon,
      required this.selectedIcon,
      required this.title,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => NavigationBarController.instance.screenIndex = index,
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavigationBarController.instance.screenIndex == index
                ? SvgPicture.asset(selectedIcon, height: 24.sp, width: 24.sp)
                : SvgPicture.asset(icon, height: 24.sp, width: 24.sp),
            Gap((XSize.spaceBtwItems / 2).h),
            Text(
              title,
              style: GoogleFonts.raleway(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: NavigationBarController.instance.screenIndex == index
                    ? XColor.secondayColor
                    : XColor.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomNavigationBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width.percentage(30), 0);
    path.lineTo(size.width.percentage(30) + size.width.percentage(5), 10.h);
    path.lineTo(size.width.percentage(65), 10.h);
    path.lineTo(size.width.percentage(70), 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class BottomNavigationBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint()
      ..color = XColor.primaryColor.withOpacity(.5)
      ..strokeWidth = 2.sp
      ..style = PaintingStyle.stroke;

    path.lineTo(size.width.percentage(30), 0);
    path.lineTo(size.width.percentage(30) + size.width.percentage(5), 10.h);
    path.lineTo(size.width.percentage(65), 10.h);
    path.lineTo(size.width.percentage(70), 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BottomNavigationBarPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(BottomNavigationBarPainter oldDelegate) => false;
}
