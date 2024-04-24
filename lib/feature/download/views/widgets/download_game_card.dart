import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class DownloadGameCard extends StatelessWidget {
  const DownloadGameCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 105.h,
      decoration: BoxDecoration(
        border: Border.all(color: XColor.primaryColor.withOpacity(.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB((XSize.spaceBtwItems / 4).w,
                (XSize.spaceBtwItems / 4).h, (XSize.spaceBtwItems / 4).w, 0),
            child: Image.asset(
              'assets/images/banner_2.png',
              fit: BoxFit.cover,
              height: 80.h,
            ),
          ),
          const Spacer(),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: (XSize.spaceBtwItems / 2).w),
            child: Text(
              'Ultimate One Piece'.toUpperCase(),
              style: GoogleFonts.quantico(
                  fontSize: 8.sp, fontWeight: FontWeight.w700),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
