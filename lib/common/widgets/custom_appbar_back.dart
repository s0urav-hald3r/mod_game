import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/utils/constants/icons.dart';
import 'package:mod_game/utils/helper/navigation.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../styles/left_padding.dart';
import '../styles/right_padding.dart';

class CustomAppBarBack extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBarBack({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      // Leading
      leadingWidth: 24.w + XSize.defaultSpace.w,
      leading: InkWell(
        onTap: () => Navigation.pop(),
        child: LeftPadding(
          child: SvgPicture.asset(XIcon.backIcon, height: 24.sp, width: 24.sp),
        ),
      ),

      // Title
      centerTitle: true,
      title: Text(
        title.toUpperCase(),
        style: GoogleFonts.piedra(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: XColor.secondayColor,
        ),
      ),

      // Tailing
      actions: [
        RightPadding(
          child:
              SvgPicture.asset(XIcon.wishlistIcon, height: 24.sp, width: 24.sp),
        ),
      ],
    );
  }
}
