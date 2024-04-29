
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/dashboard/shared/cubit/dashboard_states.dart';
import 'package:pety/features/dashboard/shared/cubit/dashobard_cubit.dart';
import 'package:pety/features/dashboard/work_hours/widgets/work_hour_bloc_listener.dart';
import 'package:pety/features/dashboard/work_hours/widgets/work_hour_item.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/widgets/default_button.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class WorkHoursScreen extends StatelessWidget{

  const WorkHoursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardCubit cubit = context.read<DashboardCubit>();
    return BlocBuilder<DashboardCubit, DashboardStates>(
      builder: (context, state) {
        if(state is GetWorkHoursError){
          return Center(
              child: Text(state.error)
          );
        }else if(cubit.workHours!=null) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (context,index) => WorkHourItem(index: index, controller:TextEditingController(),),
                            separatorBuilder: (context,index)=>const VerticalSpace(height: 10),
                            itemCount: cubit.workHours!.length
                        )
                    ),
                    VerticalSpace(height: 100.h)
                  ],
                ),
                DefaultButton(
                    text: 'Save changes',
                    color: ColorManager.orange,
                    width: double.infinity,
                    onClick: (){
                      cubit.updateWorkHours();
                    }
                ),
                const WorkHourBlocListener()
              ],
            ),
          );
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
