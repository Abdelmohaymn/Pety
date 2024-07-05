
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';


class DefaultButton extends StatelessWidget{

  final String text;
  final Function() onClick;
  final Color? color;
  final double? width;
  final double? height;
  final double? radius;
  final double? horizontalPadding;
  final TextStyle? textStyle;
  final IconData? prevIcon;

  const DefaultButton({
    super.key,
    required this.text,
    required this.onClick,
    this.color,
    this.width,
    this.height,
    this.horizontalPadding,
    this.radius,
    this.textStyle,
    this.prevIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??60.h,
      width: width,
      child: FilledButton.tonal(
        onPressed: onClick,
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: horizontalPadding??5.w)),
          backgroundColor: WidgetStatePropertyAll<Color>(color??ColorManager.defaultColor),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius??10))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(prevIcon!=null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Center(child: Icon(prevIcon,color: Colors.white,size: 18,)),
              ),
            Text(
                text,
                style:GoogleFonts.montserrat(
                  textStyle: textStyle??TextStyles.font26WhiteMedium
              )),
          ],
        ),
      ),
    );
  }

}
