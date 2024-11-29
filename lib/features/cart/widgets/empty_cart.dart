import 'package:bookia_app/core/constants/app_assets.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.cart,
            color: AppColors.primaryColor,
            width: 80,
          ),
          const Gap(20),
          Text(
            "No books in cart",
            style: getFont18TextStyle(context,),
          )
        ],
      ),
    );
  }
}
