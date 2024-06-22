import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/features/pety_layout/cubit/pet_layout_states.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class ImagePetUploader extends StatelessWidget {
  const ImagePetUploader({super.key});

  @override
  Widget build(BuildContext context) {
    PetLayoutCubit cubit = context.read<PetLayoutCubit>();
    return BlocBuilder<PetLayoutCubit, PetLayoutStates>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload an image for the missing pet',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyles.font12BlackSemiBold
              ),
            ),
            const VerticalSpace(height: 15),
            DottedBorder(
              color: ColorManager.lightBlue,
              dashPattern: const [6, 6],
              radius: const Radius.circular(10),
              borderType: BorderType.RRect,
              strokeWidth: 1.2,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: (){
                  cubit.pickImage();
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.white,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if(cubit.petImage!=null)
                        Image(
                          image: FileImage(cubit.petImage!,),
                          width: double.infinity,
                          height: 250.h,
                        ),
                      if(cubit.petImage==null)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              width: double.infinity,
                              height: 250.h,
                              image: const AssetImage('assets/images/cat_avatar.png'),
                            ),
                            Text(
                              'Upload image',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyles.font18LightBueSemiBold
                              ),
                            )
                          ],
                        ),
                    ]
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

}