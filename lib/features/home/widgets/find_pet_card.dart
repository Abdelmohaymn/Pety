
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_button.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class FindPetCard extends StatelessWidget{

  final String title,buttonText,image;
  final Function() onClick;

  const FindPetCard({
    super.key,
    required this.title,
    required this.buttonText,
    required this.image,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100.h,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 90.h,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorManager.lightBlue3,
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Image(
              height: 80.h,
              width: 90.w,
              fit: BoxFit.fill,
              image: const AssetImage('assets/images/cat_leg.png')
            ),
          ),
          AspectRatio(
            aspectRatio: 0.85,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      alignment: FractionalOffset.topCenter,
                      image: AssetImage('assets/images/$image',)
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(height: 5),
                  SizedBox(
                    width: 80.w,
                    height: 50.h,
                    child: Text(
                      title,
                      style: GoogleFonts.fredoka(
                          textStyle: TextStyles.font10WhiteRegular.copyWith(
                            fontSize: 12.sp,
                            height: 1.1
                          )
                      ),
                    ),
                  ),
                  const Spacer(),
                  DefaultButton(
                      color: Colors.white,
                      radius: 10,
                      height: 20.h,
                      width: 70.w,
                      text: buttonText,
                      textStyle: GoogleFonts.montserrat(
                          textStyle: TextStyles.font7DefaultBold
                      ),
                      onClick: onClick
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}