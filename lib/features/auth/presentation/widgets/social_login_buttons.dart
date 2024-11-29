import 'package:bookia_app/core/constants/app_assets.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 70,
            width: 70,
           // padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
             // border: Border.all(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset("assets/images/Apple.svg"),
          ),
        ),
        const Gap(10),
        Expanded(
          child: Container(
            height: 56,
            width: 105,
            //padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              //border: Border.all(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset("assets/images/Facebook.svg"),
          ),
        ),
        const Gap(10),
        Expanded(
          child: Container(
            
            //padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
             // border: Border.all(color: AppColors.primaryColor),
             borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset("assets/images/Google.svg"),
          ),
        )
      ],
    );
  }
}
