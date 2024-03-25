import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_space/widgets/app_colors.dart';
import 'package:meet_space/widgets/app_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.9,
      padding: EdgeInsets.all(screenSize.width * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize.width * 0.01),
        color: AppColors.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onTap,
            tooltip: 'Back',
            icon: const Icon(CupertinoIcons.back),
          ),
          AppText(
            text: text,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          Container()
        ],
      ),
    );
  }
}
