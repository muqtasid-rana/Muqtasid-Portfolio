// ✅ File: lib/core/constants/text_styles.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_sizes.dart';

class AppTextStyles {
  static TextStyle heading = GoogleFonts.poppins(
    fontSize: AppSizes.sp(24),
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle headingResponsive(double size) => GoogleFonts.poppins(
        fontSize: AppSizes.sp(size),
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );

  static TextStyle subheadingResponsive(double size) => GoogleFonts.poppins(
        fontSize: AppSizes.sp(size),
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );

  static TextStyle logo = GoogleFonts.kalnia(
      fontSize: AppSizes.sp(50),
      fontWeight: FontWeight.bold,
      color: Colors.green);

  static TextStyle subheading = GoogleFonts.poppins(
    fontSize: AppSizes.sp(18),
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle body = GoogleFonts.poppins(
    fontSize: AppSizes.sp(14),
    color: Colors.white,
  );

  static TextStyle bodybold = GoogleFonts.poppins(
      fontSize: AppSizes.sp(14),
      color: Colors.black,
      fontWeight: FontWeight.w600);

  static TextStyle caption = GoogleFonts.poppins(
    fontSize: AppSizes.sp(12),
    color: Colors.white60,
  );
  static TextStyle captionWhite = GoogleFonts.poppins(
    fontSize: AppSizes.sp(12),
    color: Colors.white,
  );
  static TextStyle captionBlack = GoogleFonts.poppins(
    fontSize: AppSizes.sp(12),
    color: Colors.black,
  );

  static TextStyle input = GoogleFonts.poppins(
    fontSize: AppSizes.sp(14),
    color: Colors.white,
  );

  static TextStyle button = GoogleFonts.poppins(
    fontSize: AppSizes.sp(16),
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle link = GoogleFonts.poppins(
    fontSize: AppSizes.sp(14),
    color: Colors.white,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );
}
