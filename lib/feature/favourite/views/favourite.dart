import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mod_game/common/widgets/custom_appbar_back.dart';
import 'package:mod_game/common/widgets/no_data.dart';
import 'package:mod_game/feature/home/controllers/home_controller.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import '../../../common/widgets/trending_card.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = HomeController.instance;

    return Scaffold(
      appBar: CustomAppBarBack(title: 'Favourite'.tr),
      body: Obx(
        () => homeController.favMods.isEmpty
            ? const NoData()
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
