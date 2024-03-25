import 'package:flutter/material.dart';
import 'package:meet_space/widgets/app_colors.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final double? width;
  final Color? borderColor;
  final Color? buttonColor;
  final BorderRadiusGeometry? borderRadius;
  const AppButton({
    super.key,
    required this.onTap,
    required this.child,
    this.width,
    this.borderColor,
    this.buttonColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.primaryColor,
          border: Border.all(
            color: borderColor ?? AppColors.primaryColor,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
