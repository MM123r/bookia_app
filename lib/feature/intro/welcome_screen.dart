import 'package:bookia_app/core/constants/app_assets.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/core/widgets/outlin_button.dart';
import 'package:bookia_app/feature/auth/presentation/pages/Register_screen.dart';
import 'package:bookia_app/feature/auth/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //image bg
        Image.asset(
          AppAssets.welcomePng,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),

        Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              SvgPicture.asset(AppAssets.logoSvg),
              const Gap(10),
              Text(
                "Order Your Book Now!",
                style: getfont20TextStyle(),
              ),
              const Spacer(
                flex: 5,
              ),
              CustomButton(
                  text: "Login",
                  onPressed: () {
                    pushTo(context, LoginScreen());
                  }),
              const Gap(10),
              OutlinButton(
                text: "Register",
                onPressed: () {
                  pushTo(context, RegisterScreen());
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
