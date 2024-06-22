
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/shared/constants/pety_constants.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_button.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class BeAVetCard extends StatelessWidget{
  const BeAVetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 170.h,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: 170.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorManager.lightBlue3
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 160.w,
                        child: Text(
                          'Become a Pety\nPet Sitter or Pet Groomer',
                          style: GoogleFonts.fredoka(
                              textStyle: TextStyles.font16WhiteMedium
                          ),
                        ),
                      ),
                      const Spacer(),
                      DefaultButton(
                          width: 70.w,
                          height: 30.h,
                          textStyle: GoogleFonts.montserrat(
                              textStyle: TextStyles.font7DefaultBold.copyWith(fontSize: 8)
                          ),
                          color: Colors.white,
                          radius: 6,
                          text: 'Learn More',
                          onClick: (){
                            context.read<PetLayoutCubit>().moveToWebPage(PetyWebsiteUrls.becomeAPety);
                          }
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              right: 15,
              child: Image(
                height: 150.h,
                width: 150.w,
                fit: BoxFit.fill,
                image: const AssetImage('assets/images/cat_leg.png'),
              )
          ),
          Image(
            height: 170.h,
            image: const AssetImage('assets/images/girl_dog.png'),
          )
        ],
      )
    );
  }

}