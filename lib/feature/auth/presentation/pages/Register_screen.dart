import 'package:bookia_app/core/constants/app_assets.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/feature/auth/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  leading: Padding(
    padding: const EdgeInsets.only(left: 12),
    child: IconButton(
      icon: SvgPicture.asset(
        AppAssets.backArrow, 
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
  ),
),


      //body
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Hello! Register to get started",
                style: getfont30TextStyle(
                    color: AppColors.darkColor, fontsize: 25),
              ),
              const Gap(15),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Username",
                ),
              ),

              //
              const Gap(15),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
              ),

              //
              const Gap(15),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
              ),

              //
              const Gap(15),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Confirm password",
                ),
              ),
              const Gap(20),

              CustomButton(
                text: "Register",
                onPressed: () {},
              ),
              Gap(30),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: getfont14TextStyle(color: AppColors.darkColor),
                  ),
                  TextButton(
                      onPressed: () {
                        pushTo(context, LoginScreen());
                      },
                      child: Text("Login Now",
                          style: getfont14TextStyle(
                            color: AppColors.primarYColor,
                          )))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
