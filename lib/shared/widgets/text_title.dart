
import 'package:flutter/material.dart';
import 'package:pety/shared/styles/font_families.dart';
import 'package:pety/shared/styles/texts.dart';

Widget textTitle({
  required BuildContext context,
  required String text,
})=>Text(
  text,
  style: TextStyles.font43BlackBold.copyWith(
    fontFamily: FontFamilyHelper.montserrat,
  )
);