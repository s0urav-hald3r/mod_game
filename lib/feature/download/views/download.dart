import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mod_game/common/styles/space_with_appbar.dart';
import 'package:mod_game/feature/download/views/widgets/download_game_card.dart';
import 'package:mod_game/utils/constants/sizes.dart';

import '../../../common/widgets/custom_appbar.dart';

class DownloadView extends StatelessWidget {
  const DownloadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'DOWNLOAD'),
      body: SingleChildScrollView(
        padding: XSpacing.defaultSideSpace,
        child: Column(
          children: [
            Wrap(
                spacing: XSize.spaceBtwItems.w,
                runSpacing: XSize.spaceBtwItems.h,
                children: List.generate(
                  19,
                  (index) => const DownloadGameCard(),
                ).toList()),

            //Bottom Navigation Bar Heigth
            Gap(XSize.customBottomBarHeigth.h)
          ],
        ),
      ),
    );
  }
}
