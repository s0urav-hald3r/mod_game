import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/feature/game_details/views/game_details.dart';
import 'package:mod_game/utils/helper/navigation.dart';

import '../styles/corner_clipper.dart';
import '../styles/corner_painter.dart';
import 'game_name_download.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 180.h,
          margin: EdgeInsets.fromLTRB(XSize.defaultSpace.w, 0,
              XSize.defaultSpace.w, XSize.defaultSpace.h),
          decoration: BoxDecoration(
            color: XColor.darkerGrey,
            border: Border.all(color: XColor.secondayColor.withOpacity(.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/banner_2.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 130.h,
              ),
              const Spacer(),
              const GameNameDownload(
                gameName: 'Ultimate One Piece',
                gameDownload: '2956 Download',
                borderColor: XColor.scaffoldDarkBackgroundColor,
              ),
              const Spacer(),
            ],
          ),
        ),
        Positioned(
          right: (XSize.defaultSpace * 2).w,
          bottom: 50.h,
          child: InkWell(
            onTap: () => Navigation.push(const GameDetailsView()),
            child: CustomPaint(
              painter: CornerPainter(
                color: XColor.deepYellow.withOpacity(.3),
                stroke: 0.5.sp,
                vPoint: 40,
                hPoint: 85,
              ),
              child: ClipPath(
                clipper: CornerClipper(
                  vPoint: 40,
                  hPoint: 85,
                ),
                child: Container(
                  width: 98.w,
                  height: 35.h,
                  color: XColor.black.withOpacity(.6),
                  child: Center(
                    child: CustomPaint(
                      painter: CornerPainter(
                        color: XColor.darkerGrey,
                        stroke: 1.sp,
                        vPoint: 40,
                        hPoint: 87,
                      ),
                      child: ClipPath(
                        clipper: CornerClipper(
                          vPoint: 40,
                          hPoint: 87,
                        ),
                        child: Container(
                          width: 89.w,
                          height: 27.h,
                          color: XColor.deepYellow,
                          child: Center(
                            child: Text(
                              'Details'.toUpperCase(),
                              style: GoogleFonts.quantico(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10.sp,
                                  letterSpacing: 2.sp,
                                  color: XColor.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: XSize.defaultSpace.w,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_rounded,
              color: Colors.white60,
              size: 26.sp,
            ),
          ),
        )
      ],
    );
  }
}
