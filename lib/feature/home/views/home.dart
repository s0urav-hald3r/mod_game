import 'package:flutter/material.dart';

import '../../../common/widgets/custom_appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CustomAppBar(title: 'MELON MODS'),
        ],
      ),
    );
  }
}
