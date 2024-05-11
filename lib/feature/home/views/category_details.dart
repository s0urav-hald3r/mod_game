import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/common/models/mod.dart';
import 'package:mod_game/common/styles/space_with_appbar.dart';
import 'package:mod_game/common/widgets/custom_appbar_back.dart';
import 'package:mod_game/utils/constants/enums.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import '../../../common/widgets/loader.dart';
import '../../../common/widgets/trending_card.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';
import '../controllers/home_controller.dart';

class CategoryDetailsView extends StatefulWidget {
  final ModType modType;
  const CategoryDetailsView({super.key, required this.modType});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  late HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = HomeController.instance;
    _homeController.getCategoryMods(widget.modType);
  }

  @override
  void dispose() {
    super.dispose();
    _homeController.categoryMods = <Mod>[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarBack(title: widget.modType.name.toUpperCase()),
      body: Obx(
        () => _homeController.isCategoryLoading
            ? const LoadingWidget()
            : _homeController.categoryMods.isEmpty
                ? Center(
                    child: Padding(
                      padding: XSpacing.defaultSideSpace,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(XImage.noData),
                          Text(
                            "No mods available!",
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                letterSpacing: .5,
                                color: XColor.lightYellow),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        if (_homeController.categoryMods.isNotEmpty) ...[
                          Gap(XSize.spaceBtwSections.h),
                          Column(
                            children: _homeController.categoryMods
                                .map((e) => TrendingCard(mod: e))
                                .toList(),
                          ),
                        ],
                      ],
                    ),
                  ),
      ),
    );
  }
}
