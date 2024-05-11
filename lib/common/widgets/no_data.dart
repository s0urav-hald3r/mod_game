import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/images.dart';
import '../styles/space_with_appbar.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: XSpacing.defaultSideSpace,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(XImage.noData),
            Text(
              "No mods available!",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  letterSpacing: .5,
                  color: XColor.lightYellow),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
