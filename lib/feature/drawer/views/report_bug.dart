import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/common/styles/space_with_appbar.dart';
import 'package:mod_game/common/widgets/custom_appbar_back.dart';
import 'package:mod_game/feature/drawer/controllers/drawer_controller.dart';

import '../../../common/styles/corner_clipper.dart';
import '../../../common/styles/corner_painter.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class ReportBugView extends StatefulWidget {
  const ReportBugView({super.key});

  @override
  State<ReportBugView> createState() => _ReportBugViewState();
}

class _ReportBugViewState extends State<ReportBugView> {
  final controller = CustomDrawerController.instance;

  @override
  void dispose() {
    controller.clearTextField();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarBack(title: 'Report Bug'),
      body: SingleChildScrollView(
        padding: XSpacing.defaultSideSpace,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email field
            const CustomTitle(title: 'Support email'),
            Gap(XSize.spaceBtwItems.h),
            CustomTextField(
              controller: controller.email,
              hintText: '',
              isReadOnly: true,
            ),
            Gap(XSize.spaceBtwSections.h),

            // Subject field
            const CustomTitle(title: 'Subject'),
            Gap(XSize.spaceBtwItems.h),
            CustomTextField(
                controller: controller.subject, hintText: 'enter subject here'),
            Gap(XSize.spaceBtwSections.h),

            // Description field
            const CustomTitle(title: 'Description'),
            Gap(XSize.spaceBtwItems.h),
            CustomTextField(
              controller: controller.description,
              hintText: 'enter description here',
              height: 120,
              maxLine: 5,
            ),
            Gap(XSize.spaceBtwSections.h),

            // REPORT BUG SUBMIT BUTTON
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => controller.reportBug(),
                  child: CustomPaint(
                    painter: CornerPainter(
                      color: XColor.deepYellow.withOpacity(.3),
                      stroke: 0.5.sp,
                      vPoint: 40,
                      hPoint: 90,
                    ),
                    child: ClipPath(
                      clipper: CornerClipper(vPoint: 40, hPoint: 90),
                      child: Container(
                        width: 157.w,
                        height: 40.h,
                        color: XColor.black.withOpacity(.6),
                        child: Center(
                          child: CustomPaint(
                            painter: CornerPainter(
                              color: XColor.deepYellow.withOpacity(.3),
                              stroke: 0.5.sp,
                              vPoint: 43,
                              hPoint: 91,
                            ),
                            child: ClipPath(
                              clipper: CornerClipper(vPoint: 43, hPoint: 91),
                              child: Container(
                                width: 148.w,
                                height: 30.h,
                                color: XColor.deepYellow,
                                child: Center(
                                  child: Text(
                                    'REport bug'.toUpperCase(),
                                    style: GoogleFonts.quantico(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.sp,
                                        letterSpacing: 2.sp,
                                        color: XColor.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //Bottom Navigation Bar Heigth
            Gap(XSize.customBottomBarHeigth.h)
          ],
        ),
      ),
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.quantico(
          fontSize: 16.sp,
          color: XColor.primaryColor,
          fontWeight: FontWeight.w500,
          letterSpacing: 2.sp),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.height = 40,
    this.maxLine = 1,
    this.isReadOnly = false,
  });

  final TextEditingController controller;
  final String hintText;
  final double height;
  final int maxLine;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: XColor.primaryColor),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLine,
        readOnly: isReadOnly,
        style: TextStyle(
          color: XColor.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          letterSpacing: 2.sp,
          height: 1.2, // Adjusted line height for better multiline text display
        ),
        cursorColor: XColor.white,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: XSize.spaceBtwItems.w,
              vertical: XSize.spaceBtwItems.h),
          isCollapsed: true,
          hintText: hintText.toUpperCase(),
          hintStyle: GoogleFonts.quantico(
              fontSize: 12.sp,
              color: XColor.white,
              fontWeight: FontWeight.w400,
              letterSpacing: 2.sp),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
