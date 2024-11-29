import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showErrorDialog(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.redColor,
      content: Text(
        message,
        style: getFont16TextStyle(context,color: AppColors.whiteColor),
      )));
}

showSuccessDialog(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.primaryColor,
      content: Text(
        message,
        style: getFont16TextStyle(context,color: AppColors.whiteColor),
      )));
}

showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
                'assets/images/Loading.json'), // assets\images\Loading.json
          ],
        );
      });
}
