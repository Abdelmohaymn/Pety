
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/dashboard/shared/cubit/dashboard_states.dart';
import 'package:pety/features/dashboard/shared/cubit/dashobard_cubit.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/widget_functions.dart';

class AddHistoryBlocListener extends StatelessWidget{
  const AddHistoryBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardCubit,DashboardStates>(
      listenWhen: (previous, current){
        return current is LoadAddHistory || current is SuccessAddHistory || current is ErrorAddHistory;
      },
      listener: (context,state){
        state.whenOrNull(
            loadAddHistory: (){
              showDialog(
                barrierDismissible:false,
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            successAddHistory: (){
              context.pop();
              context.pop();
              context.read<DashboardCubit>().clearHistory();
            },
            errorAddHistory: (error){
              WidgetFunctions.setupErrorState(context, error);
            }
        );
      },
      child: const SizedBox.shrink(),
    );
  }


}