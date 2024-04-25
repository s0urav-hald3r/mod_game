import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/utils/constants/icons.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import '../../../common/styles/space_with_appbar.dart';
import '../../../common/widgets/custom_appbar.dart';
import '../../../utils/constants/colors.dart';
import '../../game_details/views/widgets/recommended_card.dart';
import '../../home/views/widgets/category_title.dart';
import '../../home/views/widgets/trending_card.dart';
import '../../search/controllers/search_controller.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Community'),
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
                        height: 24.w, width: 24.w),
                    Gap(XSize.spaceBtwItems.w),
                    Expanded(
                      child: TextFormField(
                        controller: SearchController.instance.search,
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

              // Top recommended
              const CategoryTitle(title: '👑 Top Recommended'),
              Gap(XSize.defaultSpace.h),

              // List of recommended
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: XSize.defaultSpace.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...[
                      const RecommendedCard(),
                      const RecommendedCard(),
                      const RecommendedCard(),
                    ],
                    Gap(XSize.spaceBtwItems.w),
                  ],
                ),
              ),
              Gap(XSize.defaultSpace.h),

              // Trending Title
              const CategoryTitle(title: '🔥 Most Treading'),
              Gap(XSize.spaceBtwSections.h),

              const TrendingCard(),
              const TrendingCard(),

              //Bottom Navigation Bar Heigth
              Gap(XSize.customBottomBarHeigth.h)
            ],
          ),
        ));
  }
}
