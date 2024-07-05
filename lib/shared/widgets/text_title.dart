
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/shared/styles/texts.dart';

Widget textTitle({
  required BuildContext context,
  required String text,
})=>Text(
  text,
  style: GoogleFonts.montserrat(
    textStyle: TextStyles.font43BlackBold
  ),
);