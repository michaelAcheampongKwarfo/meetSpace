import 'package:flutter/material.dart';
import 'package:meet_space/widgets/app_button.dart';
import 'package:meet_space/widgets/app_colors.dart';
import 'package:meet_space/widgets/app_text.dart';

class ScheduleMeetingCard extends StatelessWidget {
  const ScheduleMeetingCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.startColor,
    required this.endColor,
  });

  final String title;
  final String subTitle;
  final String buttonText;
  final Color startColor;
  final Color endColor;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(screenSize.width * 0.05),
      width: screenSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize.width * 0.05),
        gradient: LinearGradient(
          colors: [
            startColor,
            endColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: title,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          AppText(
            text: subTitle,
            color: AppColors.whiteColor,
          ),
          SizedBox(
            height: screenSize.width * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(3, (index) {
                  return Icon(
                    Icons.people,
                    color: AppColors.whiteColor,
                    size: screenSize.width * 0.1,
                  );
                }),
              ),
              AppButton(
                onTap: () {},
                borderRadius: BorderRadius.circular(
                  screenSize.width * 0.05,
                ),
                width: screenSize.width * 0.4,
                buttonColor: AppColors.primaryColor,
                borderColor: AppColors.whiteColor,
                child: AppText(
                  text: buttonText,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
