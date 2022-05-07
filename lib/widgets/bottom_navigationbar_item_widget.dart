import 'package:flutter/material.dart';

import '../constants/colors.dart';

BottomNavigationBarItem bottomNavigationBarItemWidget(
    {required IconData iconData, required String label}) {
  return BottomNavigationBarItem(
    activeIcon: ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect bounds) {
        return ColorTheme.iconlinearGradient().createShader(bounds);
      },
      child: Icon(
        iconData,
      ),
    ),
    label: label,

    icon: Icon(iconData),
  );
}
