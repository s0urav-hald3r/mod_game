import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/common/controllers/navigation_bar_controller.dart';
import 'package:mod_game/feature/favourite/views/favourite.dart';
import 'package:mod_game/utils/constants/icons.dart';
import 'package:mod_game/utils/helper/navigation.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../styles/left_padding.dart';
import '../styles/right_padding.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function openDrawer;
  const CustomAppBar({super.key, required this.openDrawer});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  _getTitle() {
    switch (NavigationBarController.instance.screenIndex) {
      case 0:
        return 'Melon Mods';

      case 1:
        return 'Search'.tr;

      case 2:
        return 'Community'.tr;

      case 3:
        return 'Download'.tr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Leading
      leadingWidth: 24.w + XSize.defaultSpace.w,
      leading: InkWell(
        onTap: () => openDrawer(),
        child: LeftPadding(
          child: SvgPicture.asset(XIcon.menuIcon, height: 24.sp, width: 24.sp),
        ),
      ),

      // Title
      centerTitle: true,
      title: Obx(
        () => Text(
          _getTitle().toUpperCase(),
          style: GoogleFonts.piedra(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: XColor.secondayColor,
          ),
        ),
      ),

      // Tailing
      actions: [
        InkWell(
          onTap: () => Navigation.push(const FavouriteView()),
          child: RightPadding(
            child: SvgPicture.asset(XIcon.wishlistIcon,
                height: 24.sp, width: 24.sp),
          ),
        ),
        RightPadding(
          child: SvgPicture.asset(XIcon.prizeIcon, height: 24.sp, width: 24.sp),
        ),
      ],
    );
  }
}
