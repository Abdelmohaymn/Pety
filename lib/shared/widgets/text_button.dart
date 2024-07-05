

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';

Widget defaultTextButton ({
  required String text,
  required Function() onClick,
  Color? color,
  double width=60,
  double height=25
}) => TextButton(
    onPressed: onClick,
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize: Size(width.w, height.h),
      foregroundColor: color??ColorManager.defaultColor,
    ),
    child: Text(
      text,
      style: GoogleFonts.montserrat(
        textStyle: TextStyles.font12DefaultSemiBold.copyWith(
            color: color??ColorManager.defaultColor
        ),
      )
    )
);