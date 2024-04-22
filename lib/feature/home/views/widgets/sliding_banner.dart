import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';
import '../../controllers/page_view_controller.dart';

class SlidingBanner extends StatelessWidget {
  const SlidingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageViewController.instance;

    return SizedBox(
      width: double.infinity,
      height: 145.h,
      child: PageView(
        controller: controller.pageController,
        children: List.generate(
          5,
          (index) => Stack(
            children: [
              Container(
                width: double.infinity,
                height: 145.h,
                margin: EdgeInsets.symmetric(horizontal: XSize.defaultSpace.w),
                padding: EdgeInsets.symmetric(
                  horizontal: (XSize.spaceBtwItems / 2).w,
                  vertical: (XSize.spaceBtwItems / 2).h,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: XColor.primaryColor.withOpacity(.5), width: 2),
                ),
                child: Image.asset(
                  'assets/images/banner.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: (XSize.defaultSpace * 2).w,
                bottom: XSize.defaultSpace.h,
                child: ClipRRect(
                  // Clip it cleanly.
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      height: 30.h,
                      width: 145.w,
                      padding:
                          EdgeInsets.only(left: (XSize.spaceBtwItems / 2).w),
                      decoration: BoxDecoration(
                        color: XColor.white.withOpacity(.05),
                        border: const Border(
                          left: BorderSide(
                            color: XColor.secondayColor,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ultimate One Piece'.toUpperCase(),
                            style: GoogleFonts.quantico(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '2956 Download'.toUpperCase(),
                            style: GoogleFonts.quantico(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400,
                              color: XColor.secondayColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}