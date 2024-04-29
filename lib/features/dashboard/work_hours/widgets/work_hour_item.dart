


import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/dashboard/shared/cubit/dashobard_cubit.dart';
import 'package:pety/features/dashboard/work_hours/widgets/box_time.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';

class WorkHourItem extends StatelessWidget{
  int index;
  final TextEditingController controller;
  WorkHourItem({super.key,required this.index,required this.controller});


  @override
  Widget build(BuildContext context) {
    final DashboardCubit cubit = context.read<DashboardCubit>();
    controller.text = cubit.workHours![index].sessionDuration;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
      height: 120.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorManager.dashLineColor,)
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cubit.workHours![index].day,style: TextStyles.font16BlackBold,),
              const Spacer(),
              AdvancedSwitch(
                initialValue: cubit.workHours![index].isActive,
                activeColor: ColorManager.defaultColor,
                inactiveColor: ColorManager.dashLineColor,
                width: 60,
                height: 30,
                onChanged: (value){
                  cubit.changeWorkHourAvailability(index,value);
                },
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                'From',
                style: TextStyles.font8BlackRegular.copyWith(
                    color: ColorManager.hintOFSearchTextField
                ),
              ),
              BoxTime(index: index, from: true,),
              Text(
                'to',
                style: TextStyles.font8BlackRegular.copyWith(
                    color: ColorManager.hintOFSearchTextField
                ),
              ),
              BoxTime(index: index, from: false,),
              const Spacer(),
              SizedBox(
                width: 80.w,
                height: 20.h,
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'session duration',
                    hintStyle: TextStyles.font12GreyLight.copyWith(color: ColorManager.hintOFSearchTextField)
                  ),
                  onSubmitted: (value){
                    cubit.setWorkHourSessionDuration(index,value);
                  },
                  onTapOutside: (value){
                    cubit.setWorkHourSessionDuration(index,controller.text);
                  },
                ),
              ),
              Text('Minutes',style: TextStyles.font10BlackRegular,)
            ],
          )
        ],
      ),
    );
  }


}