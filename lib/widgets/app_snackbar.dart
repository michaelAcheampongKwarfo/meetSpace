import 'package:flutter/material.dart';
import 'package:meet_space/widgets/app_colors.dart';
import 'package:meet_space/widgets/app_text.dart';

class AppSnackBar {
  void showSnackBar(
      {required BuildContext context,
      required String text,
      required int duration}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        backgroundColor: AppColors.blackColor,
        content: AppText(
          text: text,
          color: AppColors.whiteColor,
          fontSize: 13.0,
        ),
        duration: Duration(seconds: duration),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
