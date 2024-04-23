import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/sizes.dart';

class LeftPadding extends StatelessWidget {
  final Widget child;
  const LeftPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: XSize.defaultSpace.w),
      child: child,
    );
  }
}
