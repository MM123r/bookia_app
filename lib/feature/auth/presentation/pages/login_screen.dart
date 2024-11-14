import 'package:bookia_app/core/constants/app_assets.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/feature/auth/presentation/pages/RePassword_screen.dart';
import 'package:bookia_app/feature/auth/presentation/pages/Register_screen.dart';
import 'package:bookia_app/feature/auth/presentation/widget/or_divider.dart';
import 'package:bookia_app/feature/auth/presentation/widget/social_login_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

      //
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Welcome back! Glad to see you, Again!",
                style: getfont30TextStyle(fontsize: 27),
              ),
              const Gap(15),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
              ),
              const Gap(15),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  suffixIconConstraints:
                      BoxConstraints(maxHeight: 17, maxWidth: 56),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: SvgPicture.asset(AppAssets.eye),
                  ),
                ),
              ),
              // const Gap(1),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        pushTo(context, RepasswordScreen());
                      },
                      child: Text(
                        "Forgot Password?",
                        style:
                            getfont16TextStyle(color: AppColors.darkgreyColor),
                      )),
                ],
              ),

              //
              const Gap(8),
              CustomButton(
                text: "Login",
                onPressed: () {},
              ),
              const Gap(20),
              OrDivider(),
              const Gap(20),
              //
              SocialLoginButtons(),

              const Gap(10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: getfont14TextStyle(),
                  ),
                  TextButton(
                      onPressed: () {
                        pushTo(context, RegisterScreen());
                      },
                      child: Text("Register Now",
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
