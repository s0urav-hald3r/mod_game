import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import '../../../../common/widgets/game_name_download.dart';
import '../../../../utils/constants/colors.dart';
import '../../controllers/page_view_controller.dart';

class SlidingBanner extends StatelessWidget {
  const SlidingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageViewController.instance;

    return SizedBox(
      width: double.infinity,
      height: 145.h,
      child: PageView(
          controller: controller.pageController,
          children: controller.randomMods
              .map(
                (e) => Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 145.h,
                      margin: EdgeInsets.symmetric(
                          horizontal: XSize.defaultSpace.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: (XSize.spaceBtwItems / 2).w,
                          vertical: (XSize.spaceBtwItems / 2).h),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: XColor.primaryColor.withOpacity(.5),
                            width: 2),
                      ),
                      child: Image.network(e.image, fit: BoxFit.cover),
                    ),
                    Positioned(
                      left: (XSize.defaultSpace * 2).w,
                      bottom: XSize.defaultSpace.h,
                      child: ClipRRect(
                        // Clip it cleanly.
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: GameNameDownload(
                            gameName: e.title ?? '',
                            gameDownload: '${e.downloads} Download',
                            borderColor: XColor.secondayColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
              .toList()),
    );
  }
}
