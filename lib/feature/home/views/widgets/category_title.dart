import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/common/styles/left_padding.dart';

import '../../../../utils/constants/colors.dart';

class CategoryTitle extends StatelessWidget {
  final String title;
  const CategoryTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return LeftPadding(
      child: Row(
        children: [
          Text(
            title.toUpperCase(),
            style: GoogleFonts.piedra(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: XColor.white),
          ),
        ],
      ),
    );
  }
}
