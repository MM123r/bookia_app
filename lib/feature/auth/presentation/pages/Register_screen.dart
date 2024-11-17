import 'dart:developer';

import 'package:bookia_app/core/constants/app_assets.dart';
import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/functions/validation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/core/widgets/nav_bar_widget.dart';
import 'package:bookia_app/feature/auth/data/model/request/user_model_params.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:bookia_app/feature/auth/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var usernameControllar = TextEditingController();
  var emailControllar = TextEditingController();
  var passwordControllar = TextEditingController();
  var confirmPasswordControllar = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: BlocListener<AuthBloc, AuthState>(
      //     listener: (context, state) {
      //       if (state is RegisterLoadingState) {
      //       } else if (state is RegisterSuccessState) {
      //         pushAndRemoveUntil(context, NavBarWidget());
      //       } else if (state is AuthErrorState) {
      //         Navigator.pop(context);
      //         showErrorDialog(context, state.message);
      //       }
      //     },
      //     child: Padding(
      //       padding: const EdgeInsets.only(left: 12),
      //       child: IconButton(
      //         icon: SvgPicture.asset(
      //           AppAssets.backArrow,
      //         ),
      //         onPressed: () {
      //           Navigator.of(context).pop();
      //         },
      //       ),
      //     ),
      //   ),
      // ),
      appBar: AppBar(),

      //body
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            showLoadDialog(context);
          } else if (state is RegisterSuccessState) {
            pushAndRemoveUntil(context,  NavBarWidget());
          } else if (state is AuthErrorState) {
            Navigator.pop(context);
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
                    "Hello! Register to get started",
                    style: getfont30TextStyle(
                        color: AppColors.darkColor, fontsize: 25),
                  ),
                  const Gap(15),
                  TextFormField(
                    controller: usernameControllar,
                    decoration: const InputDecoration(
                      hintText: "Username",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "User Name is required";
                      } else {
                        return null;
                      }
                    },
                  ),
        
                  //
                  const Gap(15),
                  TextFormField(
                    controller: emailControllar,
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      } else if (!emailValidation(value)) {
                        return "Please Enter a valid email";
                      } else {
                        return null;
                      }
                    },
                  ),
        
                  //
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
        
                  //
                  const Gap(15),
                  TextFormField(
                    controller: confirmPasswordControllar,
                    decoration: InputDecoration(
                      hintText: 'Enter Confirm password',
                      suffixIconConstraints:
                          const BoxConstraints(maxHeight: 17, maxWidth: 56),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: SvgPicture.asset(AppAssets.eye),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Confirm Password is required";
                      } else if (value.length < 8) {
                        return "Passwored must be at least 8 characters";
                      } else if (passwordControllar.text != value) {
                      return 'Password and Confirm Password must be same';
                    }
                       else {
                        return null;
                      }
                    },
                  ),
                  const Gap(20),
        
                  CustomButton(
                    text: "Register",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        
                          context.read<AuthBloc>().add(RegisterEvent(
                              UserModelParams(
                                  email: emailControllar.text,
                                  name: usernameControllar.text,
                                  password: passwordControllar.text,
                                  passwordConfirmation:
                                      confirmPasswordControllar.text)));
                        
                        // to home page
                      }
                    },
                  ),
                  const Gap(30),
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
        ),
      ),
    );
  }
}
