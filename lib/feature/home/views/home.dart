import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mod_game/utils/constants/icons.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import '../../../common/widgets/custom_appbar.dart';
import 'widgets/category_box.dart';
import 'widgets/category_title.dart';
import 'widgets/sliding_banner.dart';
import 'widgets/sliding_banner_indecator.dart';
import 'widgets/trending_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'MELON MODS'),
          Expanded(
            child: SingleChildScrollView(
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
                      children: const [
                        CategoryBox(
                          icon: XIcon.slashingIcon,
                          title: 'Slashing',
                          isSelect: true,
                        ),
                        CategoryBox(
                            icon: XIcon.firearmsIcon, title: 'Firearms'),
                        CategoryBox(
                            icon: XIcon.throwingIcon, title: 'Throwing'),
                        CategoryBox(icon: XIcon.energyIcon, title: 'Energy'),
                      ],
                    ),
                  ),
                  Gap(XSize.spaceBtwSections.h),

                  // Trending Title
                  const CategoryTitle(title: '🔥 Most Treading'),
                  Gap(XSize.spaceBtwSections.h),

                  const TrendingCard(),
                  const TrendingCard(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
