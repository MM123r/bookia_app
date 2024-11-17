import 'package:bookia_app/core/constants/app_assets.dart';
import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/core/widgets/nav_bar_widget.dart';
import 'package:bookia_app/feature/auth/data/model/request/user_model_params.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:bookia_app/feature/auth/presentation/pages/RePassword_screen.dart';
import 'package:bookia_app/feature/auth/presentation/pages/Register_screen.dart';
import 'package:bookia_app/feature/auth/presentation/widget/or_divider.dart';
import 'package:bookia_app/feature/auth/presentation/widget/social_login_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailControllar = TextEditingController();
  var passwordControllar = TextEditingController();
  var formKey = GlobalKey<FormState>();
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
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            showLoadDialog(context);
          } else if (state is LoginSuccessState) {
            pushAndRemoveUntil(context, NavBarWidget());
          } else if (state is AuthErrorState) {
            Navigator.pop(context, state.message);
             showErrorDialog(context, state.message);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    "Welcome back! Glad to see you, Again!",
                    style: getfont30TextStyle(fontsize: 27),
                  ),
                  const Gap(15),
                  TextFormField(
                    controller: emailControllar,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      } else {
                        return null;
                      }
                    },
                  ),

                  const Gap(15),

                  TextFormField(
                    controller: passwordControllar,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      suffixIconConstraints:
                          const BoxConstraints(maxHeight: 17, maxWidth: 56),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: SvgPicture.asset(AppAssets.eye),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      } else if (value.length < 8) {
                        return "Passwored must be at least 8 characters";
                      } else {
                        return null;
                      }
                    },
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
                            style: getfont14TextStyle(
                                color: AppColors.darkgreyColor),
                          )),
                    ],
                  ),

                  //
                  const Gap(8),
                  CustomButton(
                    text: "Login",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // to home page
                        context.read<AuthBloc>().add(LoginEvent(
                          UserModelParams(
                            email: emailControllar.text,
                            password: passwordControllar.text,
                          )
                        ));
                      }
                    },
                  ),
                  const Gap(20),
                  const OrDivider(),
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
        ),
      ),
    );
  }
}
