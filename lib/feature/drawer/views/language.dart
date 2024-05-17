import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/common/styles/space_with_appbar.dart';
import 'package:mod_game/common/widgets/custom_appbar_back.dart';
import 'package:mod_game/feature/drawer/controllers/drawer_controller.dart';
import 'package:mod_game/utils/constants/colors.dart';
import 'package:mod_game/utils/constants/enums.dart';
import 'package:mod_game/utils/constants/sizes.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CustomDrawerController.instance;

    return Scaffold(
      appBar: CustomAppBarBack(title: 'language'.tr),
      body: SingleChildScrollView(
        padding: XSpacing.defaultSideSpace,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'English',
                  style: GoogleFonts.quantico(
                      fontSize: 16.sp,
                      color: XColor.primaryColor,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.sp),
                ),
                Obx(
                  () => Radio(
                    value: AppLanguage.ENGLISH,
                    groupValue: controller.language.value,
                    onChanged: (language) {
                      controller.language.value = language!;
                      controller.updateLanguage();
                    },
                  ),
                ),
              ],
            ),
            Gap(XSize.spaceBtwSections.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'हिंदी',
                  style: GoogleFonts.quantico(
                      fontSize: 16.sp,
                      color: XColor.primaryColor,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.sp),
                ),
                Obx(
                  () => Radio(
                    value: AppLanguage.HINDI,
                    groupValue: controller.language.value,
                    onChanged: (language) {
                      controller.language.value = language!;
                      controller.updateLanguage();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
