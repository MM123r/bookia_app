
import 'package:bookia_app/core/utils/colors.dart';
import 'package:flutter/material.dart';


showErrorDialog(BuildContext context, String massege){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: AppColors.redColor,
   content: Text(massege)));
}