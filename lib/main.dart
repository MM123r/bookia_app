import 'package:bookia_app/core/constants/app_fonts.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/feature/intro/splash_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.whiteColor,
        fontFamily: AppFonts.dmSerifDisplay,
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.whiteColor),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.accendColor,
          filled: true,
          hintStyle: getfont16TextStyle(color:AppColors.greyColor ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.redColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.redColor),
          ),
          
          
        )
        ),
        

      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
      
    );
  }
}
