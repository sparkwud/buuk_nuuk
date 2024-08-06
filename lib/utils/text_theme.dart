import 'package:buuk_nuuk/utils/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Class containing the supported text theme styles.
TextTheme get textTheme => TextTheme(
      displayLarge: GoogleFonts.sourceSerif4(
        fontSize: 32,
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.sourceSerif4(
        fontSize: 20,
        color: Colors.black87,
        fontWeight: FontWeight.w800,
      ),
      displaySmall: GoogleFonts.sourceSerif4(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.black87,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: GoogleFonts.poppins(
        color: Colors.grey,
        fontWeight: FontWeight.w400,
      ),

      //  text field default
      bodyLarge: GoogleFonts.literata(
        color: colorScheme.secondary,
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.literata(
        color: colorScheme.secondary,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.literata(
        color: colorScheme.secondary,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: TextStyle(
        color: appColors.blueGray90001,
        fontSize: 30.sp,
        fontWeight: FontWeight.w600,
      ),

      labelLarge: TextStyle(
        color: appColors.gray50001,
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: TextStyle(
        color: appColors.blueGray90001,
        fontSize: 11.sp,
        fontWeight: FontWeight.w600,
      ),
      labelSmall: TextStyle(
        color: colorScheme.onSecondaryContainer,
        fontSize: 8.sp,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: appColors.gray90001,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: appColors.gray90001,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        color: appColors.black900,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
    );
