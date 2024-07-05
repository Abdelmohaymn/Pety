
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';

class PostEditText extends StatelessWidget{
  const PostEditText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 0.5,color: ColorManager.hintOFSearchTextField)
      ),
      child: Text(
        'What\'s on your mind?',
        style: GoogleFonts.montserrat(
          textStyle: TextStyles.font14GreyLight.copyWith(
              fontSize: 13.sp
          ),
        ),
      )
    );
  }

}