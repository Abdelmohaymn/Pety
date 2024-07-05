
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';

class CommentsBox extends StatelessWidget{
  const CommentsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){},
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 35.h,
          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
          decoration: BoxDecoration(
            color: ColorManager.black5Ops,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            children: [
              const Image(
                width: 20,
                height: 20,
                image: AssetImage('assets/images/comments.png')
              ),
              const HorizontalSpace(width: 5),
              Text(
                '10',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyles.font12BlackRegular
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}