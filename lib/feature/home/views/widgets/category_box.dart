import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/common/styles/right_padding.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import '../../../../common/styles/corner_clipper.dart';
import '../../../../common/styles/corner_painter.dart';
import '../../../../utils/constants/colors.dart';

class CategoryBox extends StatelessWidget {
  final bool isSelect;
  final String icon;
  final String title;
  const CategoryBox({
    super.key,
    this.isSelect = false,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return RightPadding(
      child: Column(
        children: [
          CustomPaint(
            painter: CornerPainter(
                color: XColor.primaryColor,
                opacity: .3,
                stroke: 1.sp,
                startPoint: 15),
            child: ClipPath(
              clipper: CornerClipper(startPoint: 15),
              child: SizedBox(
                width: 70.h,
                height: 70.h,
                child: Center(
                  child: CustomPaint(
                    painter: CornerPainter(
                        color:
                            isSelect ? XColor.secondayColor : XColor.darkerGrey,
                        opacity: 1,
                        stroke: 0.75.sp,
                        startPoint: 15),
                    child: ClipPath(
                      clipper: CornerClipper(startPoint: 15),
                      child: Container(
                        width: 60.h,
                        height: 60.h,
                        color: XColor.darkerGrey,
                        child: Center(
                          child:
                              SvgPicture.asset(icon, height: 24.h, width: 24.h),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Gap(XSize.spaceBtwItems.h),
          Text(
            title.toUpperCase(),
            style: GoogleFonts.quantico(
              fontWeight: FontWeight.w700,
              fontSize: 10.sp,
              color: isSelect
                  ? XColor.secondayColor
                  : XColor.white.withOpacity(.75),
            ),
          )
        ],
      ),
    );
  }
}
