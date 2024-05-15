import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/common/styles/space_with_appbar.dart';
import 'package:mod_game/common/widgets/custom_appbar_back.dart';
import 'package:mod_game/feature/home/controllers/home_controller.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import '../../../common/widgets/trending_card.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = HomeController.instance;

    return Scaffold(
      appBar: const CustomAppBarBack(title: 'Favourite Mods'),
      body: Obx(
        () => homeController.favMods.isEmpty
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
                child: Column(
                  children: [
                    Gap(XSize.spaceBtwSections.h),
                    Column(
                      children: homeController.favMods
                          .map((e) => TrendingCard(mod: e))
                          .toList(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
