import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/utils/helper/extension.dart';

import '../../utils/constants/colors.dart';
import '../styles/space_with_appbar.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: XColor.primaryColor,
      elevation: 5,
      width: Get.width.percentage(70),
      shape: const BeveledRectangleBorder(),
      child: Padding(
        padding: XSpacing.defaultSideSpace,
        child: Column(
          children: [
            Gap(55.h),
            Text(
              'MELON MODS',
              style: GoogleFonts.piedra(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w400,
                  color: XColor.secondayColor,
                  letterSpacing: 1.1.sp),
            ),
            Gap(65.h),
            const Divider(),
            _menuItem('How to use', () {}),
            const Divider(),
            _menuItem('language', () {}),
            const Divider(),
            _menuItem('report bug', () {}),
            const Divider(),
            _menuItem('privacy policy', () {}),
            const Divider(),
            _menuItem('more apps', () {}),
            const Divider(),
            _menuItem('about', () {}),
            const Divider(),
            _menuItem('rating', () {}),
            const Divider(),
            _menuItem('restore', () {}),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(String text, Function callBack) {
    return InkWell(
      onTap: () => callBack(),
      child: Text(
        text.toUpperCase(),
        style: GoogleFonts.piedra(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: XColor.white,
            letterSpacing: 1.25.sp),
      ),
    );
  }
}
