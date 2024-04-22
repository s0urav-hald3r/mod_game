import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

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
          SvgPicture.asset(
            'assets/icons/menu_icon.svg',
            height: 24.h,
            width: 24.h,
          ),
          const Spacer(flex: 5),
          SizedBox(
            width: 106.w,
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
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/wishlist_icon.svg',
                height: 24.h,
                width: 24.h,
              ),
              Gap(XSize.spaceBtwItems.w),
              SvgPicture.asset(
                'assets/icons/prize_icon.svg',
                height: 24.h,
                width: 24.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
