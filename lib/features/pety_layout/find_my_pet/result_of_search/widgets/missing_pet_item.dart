import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/font_families.dart';
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
                        style: TextStyles.font16BlackBold.copyWith(
                          fontFamily: FontFamilyHelper.montserrat
                        ),
                      )),
                      const VerticalSpace(height: 20),
                      Text(
                        cubit.missingPets![index].gov!,
                        style: TextStyles.font16LightBlackRegular.copyWith(
                            fontFamily: FontFamilyHelper.montserrat
                        ),
                      ),
                      const VerticalSpace(height: 10),
                      Text(
                        cubit.missingPets![index].location!,
                        style: TextStyles.font16LightBlackRegular.copyWith(
                            fontFamily: FontFamilyHelper.montserrat
                        ),
                      ),
                      const VerticalSpace(height: 20),
                      Center(
                        child: Text(
                          'Additional notes',
                          style: TextStyles.font16BlackBold.copyWith(
                            fontFamily: FontFamilyHelper.montserrat
                          ),
                        )
                      ),
                      const VerticalSpace(height: 20),
                      Text(
                        cubit.missingPets![index].note!,
                        style: TextStyles.font16LightBlackRegular.copyWith(
                            fontFamily: FontFamilyHelper.montserrat
                        ),
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
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Image.memory(
            width: double.infinity,
            height: 190.h,
            base64Decode(cubit.missingPets![index].base64!)
          ),
        )
      ),
    );
  }

}