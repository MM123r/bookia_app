import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: Divider()),
        Center(
            child: Text(
          "   Or Login with   ",
          style: getfont14TextStyle(color: AppColors.darkgreyColor),
        )),
        const Expanded(child: Divider()),
      ],
    );
  }
}
