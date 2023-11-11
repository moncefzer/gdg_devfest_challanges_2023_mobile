import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  static TextTheme get _fontTextTheme => GoogleFonts.rubikTextTheme();

  static final _blackheadlineSmall = _fontTextTheme.headlineSmall?.copyWith(
    fontSize: 24.sp,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  static final _blacktitleLarge = _fontTextTheme.titleLarge?.copyWith(
    fontSize: 22.sp,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static final _blacktitleMedium = _fontTextTheme.titleMedium?.copyWith(
    fontSize: 16.sp,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
  static final _blacktitleSmall = _fontTextTheme.titleSmall?.copyWith(
    fontSize: 14.sp,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
  static final _blackbodyLarge = _fontTextTheme.bodyLarge?.copyWith(
    fontSize: 16.sp,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
  static final _blackbodyMedium = _fontTextTheme.bodyMedium?.copyWith(
    fontSize: 14.sp,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
  static final _blackbodySmall = _fontTextTheme.bodySmall?.copyWith(
    fontSize: 12.sp,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
  static final _blacklabelLarge = _fontTextTheme.labelLarge?.copyWith(
    fontSize: 12.sp,
    color: Colors.black,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.4,
  );
  static final _blacklabelMedium = _fontTextTheme.labelMedium?.copyWith(
    fontSize: 10.sp,
    color: Colors.black,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
  );
  static final _blacklabelSmall = _fontTextTheme.labelSmall?.copyWith(
    fontSize: 8.sp,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static get lightThemeText => TextTheme(
        headlineSmall: _blackheadlineSmall,
        titleLarge: _blacktitleLarge,
        titleMedium: _blacktitleMedium,
        titleSmall: _blacktitleSmall,
        bodyLarge: _blackbodyLarge,
        bodyMedium: _blackbodyMedium,
        bodySmall: _blackbodySmall,
        labelLarge: _blacklabelLarge,
        labelMedium: _blacklabelMedium,
        labelSmall: _blacklabelSmall,
      );

  static get darkThemeText => TextTheme(
        headlineSmall: _blackheadlineSmall?.copyWith(color: Colors.white),
        titleLarge: _blacktitleLarge?.copyWith(color: Colors.white),
        titleMedium: _blacktitleMedium?.copyWith(color: Colors.white),
        titleSmall: _blacktitleSmall?.copyWith(color: Colors.white),
        bodyLarge: _blackbodyLarge?.copyWith(color: Colors.white),
        bodyMedium: _blackbodyMedium?.copyWith(color: Colors.white),
        bodySmall: _blackbodySmall?.copyWith(color: Colors.white),
        labelLarge: _blacklabelLarge?.copyWith(color: Colors.white),
        labelMedium: _blacklabelMedium?.copyWith(color: Colors.white),
        labelSmall: _blacklabelSmall?.copyWith(color: Colors.white),
      );
}
