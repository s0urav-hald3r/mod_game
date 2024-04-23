import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/sizes.dart';

class HorizontalPadding extends StatelessWidget {
  final Widget child;
  const HorizontalPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: XSize.defaultSpace.w),
      child: child,
    );
  }
}
