import 'package:flutter/cupertino.dart';

class ColorTheme {
  static LinearGradient iconlinearGradient() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff1A3263),
        Color(0xffA861BD),
        Color(0xffE45171),
      ],
    );
  }

  static LinearGradient appBarlinearGradient() {
    return const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xffE45171),
        Color(0xffA861BD),
        Color(0xff1A3263),
      ],
    );
  }
}
