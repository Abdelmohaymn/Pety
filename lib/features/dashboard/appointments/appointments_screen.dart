import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/dashboard/appointments/widgets/appointment_item.dart';
import 'package:pety/features/dashboard/shared/cubit/dashboard_states.dart';
import 'package:pety/features/dashboard/shared/cubit/dashobard_cubit.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class AppointmentsScreen extends StatelessWidget {

  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardCubit cubit = context.read<DashboardCubit>();
    return BlocBuilder<DashboardCubit, DashboardStates>(
      builder: (context, state) {
        if(state is AppointmentsError){
          return Center(
              child: Text(state.error)
          );
        }else if(cubit.appointmentsResponse!=null && cubit.appointmentsResponse!.data!.isEmpty){
          return const Center(
              child: Text('You have no appointments')
          );
        }else if(cubit.appointmentsResponse!=null) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Column(
              children: [
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => AppointmentItem(index:index),
                        separatorBuilder: (context, index) => const VerticalSpace(height: 10),
                        itemCount: cubit.appointmentsResponse!.results!.toInt()
                    )
                ),
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