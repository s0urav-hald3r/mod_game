import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/common/styles/right_padding.dart';
import 'package:mod_game/feature/home/controllers/home_controller.dart';
import 'package:mod_game/feature/home/views/category_details.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import '../../../../common/styles/corner_clipper.dart';
import '../../../../common/styles/corner_painter.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helper/navigation.dart';

class CategoryBox extends StatelessWidget {
  final bool isSelect;
  final String icon;
  final String name;
  const CategoryBox({
    super.key,
    this.isSelect = false,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HomeController.instance.selectedModType = name;
        Navigation.push(const CategoryDetailsView());
      },
      child: RightPadding(
        child: Column(
          children: [
            CustomPaint(
              painter: CornerPainter(
                color: XColor.primaryColor.withOpacity(.3),
                stroke: 1.sp,
                vPoint: 14,
                hPoint: 86,
              ),
              child: ClipPath(
                clipper: CornerClipper(
                  vPoint: 14,
                  hPoint: 86,
                ),
                child: SizedBox(
                  width: 70.sp,
                  height: 70.sp,
                  child: Center(
                    child: CustomPaint(
                      painter: CornerPainter(
                        color:
                            isSelect ? XColor.secondayColor : XColor.darkerGrey,
                        stroke: 0.75.sp,
                        vPoint: 14,
                        hPoint: 86,
                      ),
                      child: ClipPath(
                        clipper: CornerClipper(
                          vPoint: 14,
                          hPoint: 86,
                        ),
                        child: Container(
                          width: 60.sp,
                          height: 60.sp,
                          color: XColor.darkerGrey,
                          child: Center(
                            child: Image.network(icon,
                                fit: BoxFit.cover, height: 24.sp, width: 24.sp),
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
              name.toUpperCase(),
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
      ),
    );
  }
}
