import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_game/common/models/mod.dart';

import '../../feature/game_details/views/game_details.dart';
import '../../utils/helper/navigation.dart';
import 'game_name_download.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class RecommendedCard extends StatelessWidget {
  final Mod mod;
  const RecommendedCard({super.key, required this.mod});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigation.push(GameDetailsView(mod: mod)),
      child: Container(
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
              padding: EdgeInsets.fromLTRB((XSize.spaceBtwItems / 2).w,
                  (XSize.spaceBtwItems / 2).h, (XSize.spaceBtwItems / 2).w, 0),
              child: Image.network(
                mod.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 100.h,
              ),
            ),
            const Spacer(),
            GameNameDownload(
              gameName: mod.title ?? '',
              gameDownload: '${mod.downloads} Download',
              borderColor: XColor.secondayColor,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
