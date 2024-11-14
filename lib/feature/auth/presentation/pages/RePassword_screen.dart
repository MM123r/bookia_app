import 'package:bookia_app/core/constants/app_assets.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/feature/auth/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RepasswordScreen extends StatelessWidget {
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                "Forgot Password?",
                style: getfont30TextStyle(
                    color: AppColors.darkColor, fontsize: 25),
              ),
               Text(
                "Don't worry! It occurs. Please enter the email address linked with your account.",
                style: getfont16TextStyle(
                    color: AppColors.greyColor,),
              ),
                ],
              ),
              const Gap(15),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter your emal",
                ),
              ),

              

              
              
              const Gap(20),

              CustomButton(
                text: "Send Code",
                onPressed: () {},
              ),
              
              const Gap(210),

              
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Remember Password?",
                    style: getfont14TextStyle(color: AppColors.darkColor),
                  ),
                  TextButton(
                      onPressed: () {
                        pushTo(context, LoginScreen());
                      },
                      child: Text("Login",
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
