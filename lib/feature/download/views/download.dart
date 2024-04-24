import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
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
        padding: EdgeInsets.symmetric(horizontal: XSize.defaultSpace.w),
        child: Column(
          children: [
            Gap(XSize.spaceBtwSections.h),
            Wrap(
              spacing: XSize.spaceBtwItems.w,
              runSpacing: XSize.spaceBtwItems.h,
              children: const [
                DownloadGameCard(),
                DownloadGameCard(),
                DownloadGameCard(),
                DownloadGameCard(),
                DownloadGameCard(),
                DownloadGameCard(),
                DownloadGameCard(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
