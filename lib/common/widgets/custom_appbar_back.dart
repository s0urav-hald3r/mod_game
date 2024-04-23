import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/utils/constants/icons.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class CustomAppBarBack extends StatelessWidget {
  final String title;
  const CustomAppBarBack({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90.h,
      padding: EdgeInsets.fromLTRB(
          XSize.defaultSpace.w, XSize.statusBarHeigth, XSize.defaultSpace.w, 0),
      color: XColor.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(XIcon.backIcon, height: 24.h, width: 24.h),
          const Spacer(flex: 4),
          SizedBox(
            width: 167.w,
            height: 21.h,
            child: Text(
              title,
              style: GoogleFonts.piedra(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: XColor.secondayColor,
              ),
            ),
          ),
          const Spacer(flex: 2),
          SvgPicture.asset(XIcon.wishlistIcon, height: 24.h, width: 24.h),
        ],
      ),
    );
  }
}
