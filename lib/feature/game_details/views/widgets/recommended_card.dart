import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/game_name_download.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 155.h,
      margin: EdgeInsets.only(right: XSize.spaceBtwItems.w),
      decoration: BoxDecoration(
        border: Border.all(color: XColor.primaryColor.withOpacity(.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (XSize.spaceBtwItems / 2).w,
                vertical: (XSize.spaceBtwItems / 2).h),
            child: Image.asset(
              'assets/images/banner_2.png',
              fit: BoxFit.cover,
              height: 100.h,
            ),
          ),
          const Spacer(),
          const GameNameDownload(
            gameName: 'Ultimate One Piece',
            gameDownload: '2956 Download',
            borderColor: XColor.secondayColor,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
