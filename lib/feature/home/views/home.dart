import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import '../../../common/widgets/custom_appbar.dart';
import 'widgets/sliding_banner.dart';
import 'widgets/sliding_banner_indecator.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'MELON MODS'),
          Column(
            children: [
              Gap(XSize.spaceBtwSections.h),

              // Sliding banners
              const SlidingBanner(),
              Gap(XSize.spaceBtwItems.h),

              // Sliding banners indicator
              const SlidingBannerIndicator(),
              Gap(XSize.spaceBtwSections.h),
            ],
          )
        ],
      ),
    );
  }
}
