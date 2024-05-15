
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/features/pety_layout/find_my_pet/upload_pet/widgets/upload_pet_bloc_listener.dart';
import 'package:pety/features/pety_layout/find_my_pet/widgets/image_pet_uploader.dart';
import 'package:pety/features/pety_layout/find_my_pet/widgets/location_of_pet.dart';
import 'package:pety/features/pety_layout/find_my_pet/widgets/text_notes_field.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_back_app_bar.dart';
import 'package:pety/shared/widgets/default_button.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class UploadMissingPetScreen extends StatelessWidget{
  const UploadMissingPetScreen({super.key});

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    PetLayoutCubit cubit = context.read<PetLayoutCubit>();
    return PopScope(
      canPop: false,
      onPopInvoked: (v){
        if(v)return;
        cubit.onBackFromFindPet(context);
      },
      child: Scaffold(
        backgroundColor: ColorManager.backgroundBlue,
        appBar: AppBar(
          backgroundColor: ColorManager.backgroundBlue,
          leading: DefaultBackAppBar(context: context,onBack: (){cubit.onBackFromFindPet(context);},),
          title: Text(
            'Register a missing pet',
            style: GoogleFonts.montserrat(
                textStyle:TextStyles.font18LightBlackBold
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ImagePetUploader(),
                  const VerticalSpace(height: 15),
                  Row(
                    children: [
                      const Expanded(child: Divider(color: ColorManager.hintGrey,)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Or',
                          style: GoogleFonts.urbanist(
                            textStyle: TextStyles.font12DefaultRegular.copyWith(fontSize: 18.sp)
                          ),
                        ),
                      ),
                      const Expanded(child: Divider(color: ColorManager.hintGrey,)),
                    ],
                  ),
                  const VerticalSpace(height: 15),
                  DefaultButton(
                    width: double.infinity,
                    height: 40,
                    textStyle: GoogleFonts.montserrat(
                      textStyle: TextStyles.font16WhiteBold
                    ),
                    text: 'Open camera',
                    prevIcon: Icons.camera_alt_rounded,
                    onClick: (){}
                  ),
                  const VerticalSpace(height: 30),
                  const LocationOfPet(),
                  const VerticalSpace(height: 15),
                  TextNotesField(
                    controller: cubit.addressController,
                    hint: 'Detailed address',
                  ),
                  const VerticalSpace(height: 15),
                  TextNotesField(
                    controller: cubit.notesController,
                    hint: 'Additional notes like phone number, etc',
                  ),
                  const VerticalSpace(height: 30),
                  DefaultButton(
                    height: 40,
                    width: double.infinity,
                    textStyle: GoogleFonts.montserrat(
                        textStyle:TextStyles.font16WhiteBold
                    ),
                    text: 'Register pet',
                    onClick: () {
                      if(formKey.currentState!.validate()&&cubit.petImage!=null){
                        cubit.uploadMissingPet();
                      }
                    },
                  ),
                  const UploadPetBlocListener()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}