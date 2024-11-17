import 'package:bookia_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

TextStyle getfont30TextStyle(
    {double? fontsize, Color? color, FontWeight? fontweight}) {
  return TextStyle(
      fontSize: fontsize ?? 30, color: color ?? AppColors.darkColor);
}

TextStyle getfont24TextStyle(
    {double? fontsize, Color? color, FontWeight? fontweight}) {
  return TextStyle(
      fontSize: fontsize ?? 24, color: color ?? AppColors.darkColor);
}

TextStyle getfont20TextStyle({double? fontsize, Color? color}) {
  return TextStyle(
      fontSize: fontsize ?? 20, color: color ?? AppColors.darkColor);
}

TextStyle getfont18TextStyle(
    {double? fontsize, Color? color, FontWeight? fontweight}) {
  return TextStyle(
      fontSize: fontsize ?? 18, color: color ?? AppColors.darkColor);
}

TextStyle getfont16TextStyle(
    {double? fontsize, Color? color, FontWeight? fontweight}) {
  return TextStyle(
      fontSize: fontsize ?? 16, color: color ?? AppColors.darkColor);
}

TextStyle getfont14TextStyle(
    {double? fontsize, Color? color, FontWeight? fontweight}) {
  return TextStyle(
      fontSize: fontsize ?? 14, color: color ?? AppColors.darkColor);
}
