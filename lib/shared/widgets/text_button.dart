

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      style: TextStyles.font12DefaultRegular.copyWith(
        color: color??ColorManager.defaultColor
      ),
    )
);