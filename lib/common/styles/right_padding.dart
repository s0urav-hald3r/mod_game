import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/sizes.dart';

class RightPadding extends StatelessWidget {
  final Widget child;
  const RightPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: XSize.defaultSpace.w),
      child: child,
    );
  }
}
