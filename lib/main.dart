import 'package:bookia_app/core/constants/app_fonts.dart';
import 'package:bookia_app/core/services/local/app_local_storage.dart';
import 'package:bookia_app/core/services/remote/dio_provider.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/utils/theme.dart';
import 'package:bookia_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/features/intro/spalsh/splash_screen.dart';
import 'package:bookia_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioProvider.init();
  await AppLocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
         BlocProvider(
          create: (context) => ProfileBloc(),
        ),
      ],
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,

        theme: ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor,
    onSurface:AppColors.darkColor ,
    onSecondary: AppColors.whiteColor,
    ),

    fontFamily: AppFonts.dmSerifDisplay,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.accentColor,
      filled: true,
      hintStyle: getFont16TextStyle(context,color: AppColors.greyColor),
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
    ),
  ),
         
         // dark
         darkTheme: ThemeData(
            scaffoldBackgroundColor: AppColors.darkColor,
            
            colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primaryColor,
                onSurface: AppColors.whiteColor,
                onSecondary: AppColors.primaryColor,
                ),


            appBarTheme: const AppBarTheme(
              color: AppColors.primaryColor,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  fontFamily: AppFonts.dmSerifDisplay,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                color: AppColors.darkColor,),
              foregroundColor: AppColors.darkColor,
            ),

            

            /////
            
    //   inputDecorationTheme: InputDecorationTheme(
    //   fillColor: AppColors.darkColor,
    //   filled: true,
    //   hintStyle: getFont16TextStyle(context,color: AppColors.darkColor),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(8),
    //     borderSide: const BorderSide(color: AppColors.redColor),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(8),
    //     borderSide: const BorderSide(color: AppColors.darkColor),
    //   ),
    //   errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(8),
    //     borderSide: const BorderSide(color: AppColors.darkColor),
    //   ),
    //   focusedErrorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(8),
    //     borderSide: const BorderSide(color: AppColors.darkColor),
    //   ),
    // ),

            ////
            bottomNavigationBarTheme: BottomNavigationBarThemeData( backgroundColor: AppColors.whiteColor, ),
             
             
              
           listTileTheme: const ListTileThemeData(textColor: AppColors.darkColor,
           ),
           
           
         

            


            
          ),
          

        home: const SplashScreen(),
      ),
    );
  }
}
