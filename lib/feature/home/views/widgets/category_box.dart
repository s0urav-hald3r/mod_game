import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/common/styles/right_padding.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';
import 'inner_box_clipper.dart';
import 'inner_box_painter.dart';
import 'outer_box_clipper.dart';
import 'outer_box_painter.dart';

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
            painter: OuterBoxPainter(),
            child: ClipPath(
              clipper: OuterBoxClipper(),
              child: SizedBox(
                width: 70.sp,
                height: 70.sp,
                child: Center(
                  child: CustomPaint(
                    painter: InnerBoxPainter(
                        color: isSelect
                            ? XColor.secondayColor
                            : XColor.darkerGrey),
                    child: ClipPath(
                      clipper: InnerBoxClipper(),
                      child: Container(
                        width: 60.sp,
                        height: 60.sp,
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
