import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meet_space/widgets/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final double width;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final TextInputType? textInputType;
  final VoidCallback? onTap;

  const AppTextField({
    super.key,
    required this.width,
    required this.controller,
    required this.hintText,
    this.obscureText,
    this.textInputType,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isObscure = obscureText ??
        false; // Set a default value if obscureText is not provided

    return SizedBox(
      width: width,
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        keyboardType: textInputType,
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor),
        ),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          contentPadding:
              EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: AppColors.greyColor,
            ),
          ),
          fillColor: AppColors.whiteColor,
          filled: true,
          suffixIcon: IconButton(
            onPressed: onTap,
            icon: Icon(
              suffixIcon,
              color: AppColors.greyColor,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
