import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/dashboard/appointments/widgets/appointment_item.dart';
import 'package:pety/features/dashboard/history_screen/widgets/history_item.dart';
import 'package:pety/features/dashboard/shared/cubit/dashboard_states.dart';
import 'package:pety/features/dashboard/shared/cubit/dashobard_cubit.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/widgets/default_back_app_bar.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class HistoryScreen extends StatelessWidget {

  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardCubit cubit = context.read<DashboardCubit>();
    return PopScope(
      canPop: false,
      onPopInvoked: (v){
        if(v)return;
        context.pop();
        cubit.onBackFromUserHistoryScreen();
      },
      child: Scaffold(
        backgroundColor: ColorManager.backgroundBlue,
        appBar: AppBar(
          backgroundColor: ColorManager.backgroundBlue,
          leading: DefaultBackAppBar(
            context: context,
            onBack: (){
              context.pop();
              cubit.onBackFromUserHistoryScreen();
            },
          ),
          title: const Text('User History'),
          centerTitle: true,
        ),
        body: BlocBuilder<DashboardCubit, DashboardStates>(
          builder: (context, state) {
            if(state is ErrorGetUserHistory){
              return Center(
                  child: Text(state.error)
              );
            }else if(cubit.userHistoryResponse!=null) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => HistoryItem(index: index),
                            separatorBuilder: (context, index) => const VerticalSpace(height: 10),
                            itemCount: cubit.userHistoryResponse!.data!.appointments!.length
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
        ),
      ),
    );
  }

}