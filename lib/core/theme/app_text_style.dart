import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';
abstract class AppTextStyle {
  AppTextStyle._();
  static TextStyle med20Black =GoogleFonts.inter(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.black);

  static TextStyle reg14lightGrey =GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.lightGrey);

  static TextStyle med16White =GoogleFonts.inter(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.white);

  static TextStyle reg12BorderGrey =GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.borderGrey);

  static TextStyle reg16Black =GoogleFonts.inter(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black);

  static TextStyle reg16Primary=GoogleFonts.inter(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.primary);

}