import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class GameNameDownload extends StatelessWidget {
  final String gameName;
  final String gameDownload;
  final Color borderColor;
  const GameNameDownload({
    super.key,
    required this.gameName,
    required this.gameDownload,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      padding: EdgeInsets.symmetric(horizontal: (XSize.spaceBtwItems / 2).w),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: borderColor, width: 2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            gameName.toUpperCase(),
            style: GoogleFonts.quantico(
                fontSize: 12.sp, fontWeight: FontWeight.w700),
          ),
          Text(
            gameDownload.toUpperCase(),
            style: GoogleFonts.quantico(
              fontSize: 8.sp,
              fontWeight: FontWeight.w400,
              color: XColor.secondayColor,
            ),
          )
        ],
      ),
    );
  }
}
