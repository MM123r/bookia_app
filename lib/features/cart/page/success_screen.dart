import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/core/widgets/nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/Success.svg"),
            Text(
              "SUCCESS!",
              style: getFont30TextStyle(context,),
            ),
            Text(
              "Your order will be delivered soon.",
              textAlign: TextAlign.center,
              style: getFont16TextStyle(context,),
            ),
            const Gap(2),
            Text(
              "Thank you for choosing our app!",
              textAlign: TextAlign.center,
              style: getFont16TextStyle(context,),
            ),
            const Gap(30),
            Padding(
              padding: const EdgeInsets.all(22),
              child: CustomButton(
                  text: "Back To Home",
                  onPressed: () {
                    pushAndRemoveUntil(context, const NavBarWidget());
                  }),
            )
          ],
        ),
      ),
    );
  }
}
