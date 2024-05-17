import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/common/styles/horizontal_padding.dart';
import 'package:mod_game/common/styles/space_with_appbar.dart';
import 'package:mod_game/common/models/mod.dart';
import 'package:mod_game/data/repositorys/game_details_repo.dart';
import 'package:mod_game/feature/game_details/controllers/game_details_controller.dart';
import 'package:mod_game/feature/home/controllers/home_controller.dart';
import 'package:mod_game/feature/home/views/widgets/category_title.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import '../../../common/styles/corner_clipper.dart';
import '../../../common/styles/corner_painter.dart';
import '../../../common/widgets/custom_appbar_back.dart';
import '../../../common/widgets/game_name_download.dart';
import '../../../utils/constants/colors.dart';
import '../../../common/widgets/recommended_card.dart';

class GameDetailsView extends StatelessWidget {
  final Mod mod;
  const GameDetailsView({super.key, required this.mod});

  @override
  Widget build(BuildContext context) {
    final controller = GameDetailsController.instance;
    final homeController = HomeController.instance;
    controller.isLearnMoreClicked = false;

    final repo = GameDetailsRepo.instance;

    return Scaffold(
      appBar: CustomAppBarBack(title: mod.title!),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Game's thumbnail
            Stack(
              children: [
                Image.network(
                  mod.image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 180.h,
                ),
                Positioned(
                  right: XSize.spaceBtwItems.w,
                  top: XSize.spaceBtwItems.h,
                  child: IconButton(
                    onPressed: () => homeController.toggleFavorite(mod),
                    icon: Obx(
                      () => Icon(
                        Icons.favorite_rounded,
                        color: homeController.favMods
                                .any((favMod) => favMod.id == mod.id)
                            ? Colors.red
                            : Colors.white60,
                        size: 26.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Gam's title
            Container(
              width: double.infinity,
              margin: XSpacing.defaultSideSpace,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Game's title
                  GameNameDownload(
                    gameName: mod.title ?? '',
                    gameDownload: '${mod.downloads} Download',
                    borderColor: XColor.secondayColor,
                  ),
                  Gap(XSize.spaceBtwItems.h),

                  // Game's description
                  Obx(
                    () => Text(
                      controller.isLearnMoreClicked
                          ? (mod.description ?? '')
                          : (mod.description ?? '').split('\n').first,
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          letterSpacing: .5,
                          color: XColor.lightYellow),
                    ),
                  ),
                ],
              ),
            ),

            // Buttons
            HorizontalPadding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => controller.isLearnMoreClicked = true,
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
                                  color: XColor.black.withOpacity(.2),
                                  child: Center(
                                    child: Text(
                                      'Learn More'.tr.toUpperCase(),
                                      style: GoogleFonts.quantico(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.sp,
                                          letterSpacing: 2.sp,
                                          color: XColor.deepYellow),
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
                  InkWell(
                    onTap: () {
                      repo.mod.value = mod;
                      controller.downloadModToStorage();
                    },
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
                                      'Download'.tr.toUpperCase(),
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
            ),

            if (HomeController.instance.recommendedMods.isNotEmpty) ...[
              Gap(XSize.spaceBtwSections.h),

              // Top recommended
              CategoryTitle(title: '👑 Top Recommended'.tr),
              Gap(XSize.spaceBtwSections.h),

              // List of recommended mods
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: XSize.defaultSpace.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...HomeController.instance.recommendedMods
                        .map((e) => RecommendedCard(mod: e))
                        .toList(),
                    Gap(XSize.spaceBtwItems.w),
                  ],
                ),
              ),
            ],
            Gap(XSize.defaultSpace.h),
          ],
        ),
      ),
    );
  }
}
