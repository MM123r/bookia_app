import 'package:bookia_app/core/constants/app_fonts.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

TextStyle getFont30TextStyle(BuildContext context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 30,
    color: color ??Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle getFont24TextStyle(BuildContext context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 24,
    color: color ??Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle getFont20TextStyle(BuildContext context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 20,
    color: color ?? AppColors.darkColor,
  );
}

TextStyle getFont18TextStyle(BuildContext context,
  {double? fontSize, Color? color}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    color: color ??Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle getFontBook16TextStyle(BuildContext context,{double? fontSize, Color? color}) {
  return TextStyle(
    fontSize: fontSize ?? 16,
    color: color ??AppColors.darkColor,
    fontFamily: AppFonts.dmSerifDisplay
  );
}

TextStyle getFont14TextStyle(BuildContext context,{double? fontSize, Color? color}) {
  return TextStyle(
    fontSize: fontSize ?? 14,
    color: color ??Theme.of(context).colorScheme.onSurface,
  );
}



TextStyle getFont16TextStyle(BuildContext context,{double? fontSize, Color? color}) {
  return TextStyle(
    fontSize: fontSize ?? 16,
    color: color ??Theme.of(context).colorScheme.onSurface,
    fontFamily: AppFonts.dmSerifDisplay
  );
}
