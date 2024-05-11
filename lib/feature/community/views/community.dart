import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/utils/constants/icons.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import '../../../utils/constants/colors.dart';
import '../../../common/widgets/recommended_card.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/widgets/category_title.dart';
import '../../../common/widgets/trending_card.dart';
import '../../search/controllers/search_controller.dart' as GetX;

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(XSize.spaceBtwSections.h),

            // Search Box
            Container(
              height: 40.h,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: XSize.defaultSpace.w),
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
                      controller: GetX.SearchController.instance.search,
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

            if (HomeController.instance.recommendedMods.isNotEmpty) ...[
              Gap(XSize.spaceBtwSections.h),

              // Top recommended
              const CategoryTitle(title: '👑 Top Recommended'),
              Gap(XSize.spaceBtwSections.h),

              // List of recommended mods
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: XSize.defaultSpace.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...HomeController.instance.recommendedMods
                        .map((e) => RecommendedCard(mod: e))
                        .toList(),
                    Gap(XSize.spaceBtwItems.w),
                  ],
                ),
              ),
            ],

            if (HomeController.instance.mostTrendingMods.isNotEmpty) ...[
              Gap(XSize.spaceBtwSections.h),

              // Trending Title
              const CategoryTitle(title: '🔥 Most Trending'),
              Gap(XSize.spaceBtwSections.h),

              // List of trending mods
              Column(
                children: HomeController.instance.mostTrendingMods
                    .map((e) => TrendingCard(mod: e))
                    .toList(),
              ),
            ],

            //Bottom Navigation Bar Heigth
            Gap(XSize.customBottomBarHeigth.h)
          ],
        ),
      ),
    );
  }
}
