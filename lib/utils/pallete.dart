import 'package:flutter/material.dart';

AppColors get appColors => AppColors();

ColorScheme get colorScheme => const ColorScheme.light(
      // Primary colors
      primary: Color(0XFF0F2B0B),
      primaryContainer: Color(0XFF7D7D7D),
      secondaryContainer: Color(0XFF212121),

      // Error colors
      errorContainer: Color(0XFFE50000),
      onErrorContainer: Color(0XFFFFFFFF),

      // On colors(text colors)
      onPrimary: Color(0X1EFACC15),
      onPrimaryContainer: Color(0XFF001739),
      onSecondaryContainer: Color(0XFFC3C2BE),
    );

/// Class containing custom colors for a primary theme.
class AppColors {

  Color get gray90002 => const Color(0XFF191D31);
  Color get black900 => const Color(0XFF071018);
  Color get gray50002 => const Color(0XFF9597A6);
  Color get gray90001 => const Color(0XFF091824);
  Color get blueGray90001 => const Color(0XFF373737);
  Color get gray50001 => const Color(0XFF989898);


  // Green
  Color get green50 => const Color(0XFFDFF7E3);
  Color get black => Colors.black87;
  Color get lightBlue => const Color(0xffCFEDEF);

  List<Color> get boxColors => const [
        Color(0xffCEEDEF),
        Color(0xffBFBFBF),
        Color(0xffEBECF1),
        Color(0xffFDF7DD),
        Color(0xffF9CFE3),
        Color(0xffFBEBC7),
        Color(0xffE9E8E6),
      ];
}
