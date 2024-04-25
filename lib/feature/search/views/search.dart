import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/common/styles/space_with_appbar.dart';
import 'package:mod_game/feature/search/controllers/search_controller.dart';

import '../../../common/widgets/custom_appbar.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/icons.dart';
import '../../../utils/constants/sizes.dart';
import '../../home/views/widgets/trending_card.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Melon Mods'),
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
                  SvgPicture.asset(XIcon.searchIcon, height: 24.w, width: 24.w),
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

            const TrendingCard(),
            const TrendingCard(),
            const TrendingCard(),

            //Bottom Navigation Bar Heigth
            Gap(XSize.customBottomBarHeigth.h)
          ],
        ),
      ),
    );
  }
}
