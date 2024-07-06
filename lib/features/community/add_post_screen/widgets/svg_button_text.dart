
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';

class SvgButtonText extends StatelessWidget{
  final String img,title;
  final Function()? onTab;
  const SvgButtonText({
    super.key,
    required this.img,
    required this.title,
    required this.onTab
  });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTab,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svgs/$img.svg'),
            const HorizontalSpace(width: 5),
            Text(
              title,
              style: TextStyles.font13BlackRegular.copyWith(
                fontFamily: "Montserrat"
              ),
            )
          ],
        ),
      ),
    );
  }
  
}