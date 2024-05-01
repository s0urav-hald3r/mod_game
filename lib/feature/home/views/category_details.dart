import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mod_game/common/widgets/custom_appbar_back.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import '../../../common/widgets/trending_card.dart';

class CategoryDetailsView extends StatelessWidget {
  final String appBarTitle;
  const CategoryDetailsView({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarBack(title: appBarTitle),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(XSize.defaultSpace.h),
            const TrendingCard(),
            const TrendingCard(),
            const TrendingCard(),
          ],
        ),
      ),
    );
  }
}
