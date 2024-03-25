import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxlines;
  const AppText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.textOverflow,
    this.maxlines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color,
          fontSize: fontSize ?? 16.0,
          fontWeight: fontWeight ?? FontWeight.w500,
        ),
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxlines,
    );
  }
}
