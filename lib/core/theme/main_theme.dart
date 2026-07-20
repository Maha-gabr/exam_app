import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theme/app_text_style.dart';

import 'app_color.dart';
 class AppTheme{
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      // helperText: ' ',
      errorMaxLines: 2,
      helperStyle: const TextStyle(
        height: 1,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      alignLabelWithHint: true,
      filled: true,
      fillColor: AppColors.white,
      contentPadding:  EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 14.h,
      ),

      border: OutlineInputBorder(
        
        borderRadius: BorderRadius.circular(4.r),
        borderSide: const BorderSide(
          color: AppColors.borderGrey,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: const BorderSide(
          color: AppColors.borderGrey,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: const BorderSide(
          color: AppColors.borderGrey,
          width: 2,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: const BorderSide(
          color: AppColors.red,
        ),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: const BorderSide(
          color: AppColors.borderGrey,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: const BorderSide(
          color: AppColors.red,
          width: 2,
        ),
      ),
      labelStyle: AppTextStyle.reg12BorderGrey,
      hintStyle: AppTextStyle.reg14lightGrey,
      errorStyle: AppTextStyle.reg12BorderGrey.copyWith(color: AppColors.red,fontSize: 10.sp),),
    elevatedButtonTheme:  ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 48.h),
        padding: EdgeInsets.symmetric(
          horizontal:8.w ,
          vertical:16.h ,
        ),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16.r)
        ),
      ),
    ),


    );


}