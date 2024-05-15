import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class MissingPetItem extends StatelessWidget {
  final int index;
  const MissingPetItem({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    PetLayoutCubit cubit = context.read<PetLayoutCubit>();
    return DottedBorder(
      color: ColorManager.lightBlue,
      dashPattern: const [6, 6],
      padding: const EdgeInsets.all(16),
      radius: const Radius.circular(10),
      borderType: BorderType.RRect,
      strokeWidth: 1.2,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: (){
          showAdaptiveDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Text(
                        'Pet was found in',
                        style: GoogleFonts.montserrat(
                          textStyle:TextStyles.font16BlackBold
                        ),
                      )),
                      const VerticalSpace(height: 20),
                      Text(
                        cubit.missingPets![index].gov!,
                        style: GoogleFonts.montserrat(textStyle:TextStyles.font16LightBlackRegular),
                      ),
                      const VerticalSpace(height: 10),
                      Text(
                        cubit.missingPets![index].location!,
                        style: GoogleFonts.montserrat(textStyle:TextStyles.font16LightBlackRegular),
                      ),
                      const VerticalSpace(height: 20),
                      Center(
                        child: Text(
                          'Additional notes',
                          style: GoogleFonts.montserrat(
                              textStyle:TextStyles.font16BlackBold
                          ),
                        )
                      ),
                      const VerticalSpace(height: 20),
                      Text(
                        cubit.missingPets![index].note!,
                        style: GoogleFonts.montserrat(textStyle:TextStyles.font16LightBlackRegular),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      'Ok',
                      style: TextStyles.font12DefaultRegular,
                    ),
                  ),
                ],
              );
            }
          );
        },
        child: Image.memory(
          width: double.infinity,
          height: 190.h,
          base64Decode(cubit.missingPets![index].base64!)
        )
      ),
    );
  }

}