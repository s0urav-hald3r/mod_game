import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mod_game/common/widgets/loader.dart';
import 'package:mod_game/feature/home/controllers/home_controller.dart';
import 'package:mod_game/feature/home/controllers/page_view_controller.dart';
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
  final _homeController = HomeController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _homeController.isTrendingLoading ||
                _homeController.isGetCategoryLoading
            ? const LoadingWidget()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(XSize.spaceBtwSections.h),

                    if (PageViewController.instance.randomMods.isNotEmpty) ...[
                      // Sliding banners
                      const SlidingBanner(),
                      Gap(XSize.spaceBtwItems.h),

                      // Sliding banners indicator
                      const SlidingBannerIndicator(),
                      Gap(XSize.spaceBtwSections.h),
                    ],

                    if (_homeController.categories.isNotEmpty) ...[
                      // Category Title
                      const CategoryTitle(title: '👾 Categories'),
                      Gap(XSize.spaceBtwSections.h),

                      // List of categories
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: XSize.defaultSpace.w),
                        child: Row(
                          children: _homeController.categories
                              .map(
                                (e) => CategoryBox(
                                  icon: e.image!,
                                  name: e.name!,
                                  isSelect:
                                      _homeController.selectedModType == e.name,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      Gap(XSize.spaceBtwSections.h),
                    ],

                    if (_homeController.mostTrendingMods.isNotEmpty) ...[
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
