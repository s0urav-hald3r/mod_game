import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/common/styles/space_with_appbar.dart';
import 'package:mod_game/feature/search/controllers/search_controller.dart'
    as GetX;

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/icons.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';
import '../../../common/widgets/trending_card.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetX.SearchController.instance;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Box
            Container(
              height: 40.h,
              width: double.infinity,
              margin: XSpacing.defaultSideSpace,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: XColor.primaryColor)),
              child: Row(
                children: [
                  Gap(XSize.spaceBtwItems.w),
                  SvgPicture.asset(XIcon.searchIcon,
                      height: 24.sp, width: 24.sp),
                  Gap(XSize.spaceBtwItems.w),
                  Expanded(
                    child: TextFormField(
                      controller: controller.search,
                      onChanged: (value) => controller.filterMods(),
                      style: TextStyle(
                        color: XColor.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2.sp,
                        height: 0.0,
                      ),
                      cursorColor: XColor.white,
                      textAlignVertical: TextAlignVertical.center,
                      cursorHeight: 0.5.h,
                      cursorWidth: 15.w,
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(bottom: 5.h),
                        isCollapsed: true,
                        hintText: 'type to search'.toUpperCase(),
                        hintStyle: GoogleFonts.quantico(
                            fontSize: 12.sp,
                            color: XColor.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2.sp),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(() => controller.filteredMods.isNotEmpty
                ? Column(
                    children: controller.filteredMods
                        .map((e) => TrendingCard(mod: e))
                        .toList(),
                  )
                : Center(
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
                  )),

            //Bottom Navigation Bar Heigth
            Gap(XSize.customBottomBarHeigth.h)
          ],
        ),
      ),
    );
  }
}
