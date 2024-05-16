import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/common/styles/space_with_appbar.dart';
import 'package:mod_game/feature/download/controller/download_controller.dart';
import 'package:mod_game/feature/download/views/widgets/download_game_card.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';

class DownloadView extends StatelessWidget {
  const DownloadView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DownloadController.instance;

    return Scaffold(
      body: Obx(
        () => controller.downloadedMods.isEmpty
            ? Center(
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
              )
            : SingleChildScrollView(
                padding: XSpacing.defaultSideSpace,
                child: Column(
                  children: [
                    Wrap(
                        spacing: XSize.spaceBtwItems.w,
                        runSpacing: XSize.spaceBtwItems.h,
                        children: controller.downloadedMods
                            .map((e) => DownloadGameCard(mod: e))
                            .toList()),

                    //Bottom Navigation Bar Heigth
                    Gap(XSize.customBottomBarHeigth.h)
                  ],
                ),
              ),
      ),
    );
  }
}
