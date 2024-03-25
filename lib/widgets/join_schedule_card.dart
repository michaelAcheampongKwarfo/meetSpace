import 'package:flutter/material.dart';
import 'package:meet_space/widgets/app_colors.dart';
import 'package:meet_space/widgets/app_text.dart';

class JoinScheduleButton extends StatelessWidget {
  const JoinScheduleButton({
    super.key,
    required this.screenSize,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final Size screenSize;
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenSize.width * 0.46,
        padding: EdgeInsets.all(
          screenSize.width * 0.03,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(
            screenSize.width * 0.05,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: screenSize.width * 0.1,
              color: AppColors.whiteColor,
            ),
            SizedBox(
              height: screenSize.width * 0.03,
            ),
            AppText(
              text: text,
              fontSize: 14.0,
              color: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
