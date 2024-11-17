import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class OutlinButton extends StatelessWidget {
  const OutlinButton({
    super.key,
    this.width = double.infinity,
    this.height = 56,
    required this.text,
    this.bgcolor,
    this.textColor,
    required this.onPressed,
  });

  final double width;
  final double height;
  final Color? bgcolor;
  final Color? textColor;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: AppColors.darkColor),
          backgroundColor: bgcolor ?? AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: getfont16TextStyle(
            color: textColor ?? AppColors.darkColor,
          ),
        ),
      ),
    );
  }
}
