import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/common/styles/horizontal_padding.dart';
import 'package:mod_game/common/styles/space_with_appbar.dart';
import 'package:mod_game/feature/home/views/widgets/category_title.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import '../../../common/styles/corner_clipper.dart';
import '../../../common/styles/corner_painter.dart';
import '../../../common/widgets/custom_appbar_back.dart';
import '../../../common/widgets/game_name_download.dart';
import '../../../utils/constants/colors.dart';
import 'widgets/recommended_card.dart';

class GameDetailsView extends StatelessWidget {
  const GameDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarBack(title: 'Ultimate one piece'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Game's thumbnail
            SizedBox(
              width: double.infinity,
              height: 180.h,
              child:
                  Image.asset('assets/images/banner_2.png', fit: BoxFit.cover),
            ),

            // Gam's title
            Container(
              width: double.infinity,
              margin: XSpacing.defaultSideSpace,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Game's title
                  const GameNameDownload(
                    gameName: 'Ultimate One Piece',
                    gameDownload: '2956 Download',
                    borderColor: XColor.secondayColor,
                  ),
                  Gap(XSize.spaceBtwItems.h),

                  // Game's description
                  Text(
                    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt labore et dolore magna aliqua. Ut enim ad minim.''',
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        letterSpacing: .5,
                        color: XColor.lightYellow),
                  ),
                  Gap(XSize.spaceBtwItems.h),
                  Text(
                    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt labore et dolore magna aliqua. Ut enim ad minim.''',
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        letterSpacing: .5,
                        color: XColor.lightYellow),
                  ),
                ],
              ),
            ),

            // Buttons
            HorizontalPadding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPaint(
                    painter: CornerPainter(
                      color: XColor.deepYellow.withOpacity(.3),
                      stroke: 0.5.sp,
                      vPoint: 40,
                      hPoint: 90,
                    ),
                    child: ClipPath(
                      clipper: CornerClipper(vPoint: 40, hPoint: 90),
                      child: Container(
                        width: 157.w,
                        height: 40.h,
                        color: XColor.black.withOpacity(.6),
                        child: Center(
                          child: CustomPaint(
                            painter: CornerPainter(
                              color: XColor.deepYellow.withOpacity(.3),
                              stroke: 0.5.sp,
                              vPoint: 43,
                              hPoint: 91,
                            ),
                            child: ClipPath(
                              clipper: CornerClipper(vPoint: 43, hPoint: 91),
                              child: Container(
                                width: 148.w,
                                height: 30.h,
                                color: XColor.black.withOpacity(.2),
                                child: Center(
                                  child: Text(
                                    'Learn More'.toUpperCase(),
                                    style: GoogleFonts.quantico(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.sp,
                                        letterSpacing: 2.sp,
                                        color: XColor.deepYellow),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomPaint(
                    painter: CornerPainter(
                      color: XColor.deepYellow.withOpacity(.3),
                      stroke: 0.5.sp,
                      vPoint: 40,
                      hPoint: 90,
                    ),
                    child: ClipPath(
                      clipper: CornerClipper(vPoint: 40, hPoint: 90),
                      child: Container(
                        width: 157.w,
                        height: 40.h,
                        color: XColor.black.withOpacity(.6),
                        child: Center(
                          child: CustomPaint(
                            painter: CornerPainter(
                              color: XColor.deepYellow.withOpacity(.3),
                              stroke: 0.5.sp,
                              vPoint: 43,
                              hPoint: 91,
                            ),
                            child: ClipPath(
                              clipper: CornerClipper(vPoint: 43, hPoint: 91),
                              child: Container(
                                width: 148.w,
                                height: 30.h,
                                color: XColor.deepYellow,
                                child: Center(
                                  child: Text(
                                    'Download'.toUpperCase(),
                                    style: GoogleFonts.quantico(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.sp,
                                        letterSpacing: 2.sp,
                                        color: XColor.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(XSize.defaultSpace.h),

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
          ],
        ),
      ),
    );
  }
}
