
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/font_families.dart';
import 'package:pety/shared/styles/texts.dart';

class AppointmentItem extends StatelessWidget{

  final int index;

  AppointmentItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    SearchVetCubit cubit = context.read<SearchVetCubit>();
    final item = cubit.chosenVet!.availabilityFormatted![index];
    return SizedBox(
      width: 50.w,
      child: Card(
          color: index==cubit.clickedAppointment?ColorManager.orange:ColorManager.defaultColor,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            onTap: (){
              cubit.changeClickedAppointment(index);
            },
            borderRadius: BorderRadius.circular(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.formatedDate![0],
                  style: TextStyles.font12WhiteRegular.copyWith(
                    color: index==cubit.clickedAppointment?Colors.black:Colors.white,
                    fontFamily: FontFamilyHelper.montserrat
                  ),
                ),
                Text(
                  item.formatedDate![1],
                  style: TextStyles.font20WhiteRegular.copyWith(
                      height: 0.7,
                      color: index==cubit.clickedAppointment?Colors.black:Colors.white,
                      fontFamily: FontFamilyHelper.poetsenOne
                  ),
                ),
                Text(
                  item.formatedDate![2],
                  style: TextStyles.font12WhiteRegular.copyWith(
                      color: index==cubit.clickedAppointment?Colors.black:Colors.white,
                      fontFamily: FontFamilyHelper.montserrat
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }

}