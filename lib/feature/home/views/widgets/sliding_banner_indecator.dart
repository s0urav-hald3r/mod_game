import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';
import '../../controllers/page_view_controller.dart';

class SlidingBannerIndicator extends StatelessWidget {
  const SlidingBannerIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = PageViewController.instance;

    return SmoothPageIndicator(
      controller: controller.pageController,
      count: 5,
      effect: ExpandingDotsEffect(
        activeDotColor: XColor.secondayColor,
        dotColor: XColor.white.withOpacity(.2),
        expansionFactor: 5.w,
        dotHeight: 5.w,
        dotWidth: 5.w,
      ),
    );
  }
}
