import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mod_game/common/widgets/loader.dart';
import 'package:mod_game/feature/home/controllers/home_controller.dart';
import 'package:mod_game/utils/constants/enums.dart';
import 'package:mod_game/utils/constants/icons.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import 'widgets/category_box.dart';
import 'widgets/category_title.dart';
import 'widgets/sliding_banner.dart';
import 'widgets/sliding_banner_indecator.dart';
import '../../../common/widgets/trending_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = HomeController.instance;
    if (_homeController.mostTrendingMods.isEmpty) {
      _homeController.getMostTrendingMods();
    }
    if (_homeController.recommendedMods.isEmpty) {
      _homeController.getRecommendedMods();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _homeController.isTrendingLoading
            ? const LoadingWidget()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(XSize.spaceBtwSections.h),

                    // Sliding banners
                    const SlidingBanner(),
                    Gap(XSize.spaceBtwItems.h),

                    // Sliding banners indicator
                    const SlidingBannerIndicator(),
                    Gap(XSize.spaceBtwSections.h),

                    // Category Title
                    const CategoryTitle(title: '👾 Categories'),
                    Gap(XSize.spaceBtwSections.h),

                    // List of categories
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: XSize.defaultSpace.w),
                      child: Row(
                        children: [
                          CategoryBox(
                            icon: XIcon.slashingIcon,
                            modType: ModType.SLASHING,
                            isSelect: _homeController.selectedModType ==
                                ModType.SLASHING,
                          ),
                          CategoryBox(
                            icon: XIcon.firearmsIcon,
                            modType: ModType.FIREARMS,
                            isSelect: _homeController.selectedModType ==
                                ModType.FIREARMS,
                          ),
                          CategoryBox(
                            icon: XIcon.throwingIcon,
                            modType: ModType.THROWING,
                            isSelect: _homeController.selectedModType ==
                                ModType.THROWING,
                          ),
                          CategoryBox(
                            icon: XIcon.energyIcon,
                            modType: ModType.ENERGY,
                            isSelect: _homeController.selectedModType ==
                                ModType.ENERGY,
                          ),
                        ],
                      ),
                    ),

                    if (_homeController.mostTrendingMods.isNotEmpty) ...[
                      Gap(XSize.spaceBtwSections.h),

                      // Trending Title
                      const CategoryTitle(title: '🔥 Most Trending'),
                      Gap(XSize.spaceBtwSections.h),

                      Column(
                        children: _homeController.mostTrendingMods
                            .map((e) => TrendingCard(mod: e))
                            .toList(),
                      ),
                    ],

                    //Bottom Navigation Bar Heigth
                    Gap(XSize.customBottomBarHeigth.h)
                  ],
                ),
              ),
      ),
    );
  }
}
