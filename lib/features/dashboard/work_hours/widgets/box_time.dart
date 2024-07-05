
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/features/dashboard/shared/cubit/dashobard_cubit.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';

class BoxTime extends StatelessWidget{
  final int index;
  final bool from;
  const BoxTime({super.key,required this.index, required this.from});

  @override
  Widget build(BuildContext context) {
    final DashboardCubit cubit = context.read<DashboardCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: InkWell(
        onTap: (){
          showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()))
              .then((value){
                if(value!=null){
                  cubit.updateWorkHourTime(value, index, from);
              }
          });
        },
        splashColor: ColorManager.defaultColor,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 1.w,vertical: 1.h),
          width: 50.w,
          height: 25.h,
          decoration: const BoxDecoration(
              color: ColorManager.dashLineColor
          ),
          child: Text(
            from?cubit.workHours![index].from:cubit.workHours![index].to,
            style: GoogleFonts.montserrat(
              textStyle: TextStyles.font12BlackRegular
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

}