
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Card(
      color: ColorManager.defaultColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      child: Container(
        padding: EdgeInsets.only(
          left: 8.w,
          top: 8.h,
        ),
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Become a Pety,\nPet Sitter or\nGroomer',style: TextStyles.font26WhiteMedium,),
                Text(
                    'earn extra income by\nsharing your love and\ncare for pets',
                    style: TextStyles.font13WhiteRegular
                ),
                const VerticalSpace(height: 10),
                DefaultButton(
                  height: 30.h,
                  radius: 5,
                  color: ColorManager.orange,
                  textStyle: TextStyles.font10WhiteRegular,
                  text: 'Learn more',
                  onClick: () {
                    context.read<PetLayoutCubit>().moveToWebPage(PetyWebsiteUrls.becomeAPety);
                  },
                ),
                const VerticalSpace(height: 10)
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image(
                image: const AssetImage(
                    'assets/images/girl_dog.png'
                ),
                height: 140.h,
                width: 100.w,
              ),
            )
          ],
        ),
      ),
    );
  }

}