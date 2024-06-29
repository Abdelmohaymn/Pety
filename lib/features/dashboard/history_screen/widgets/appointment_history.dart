import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/dashboard/history_screen/widgets/add_history_bloc_listener.dart';
import 'package:pety/features/dashboard/history_screen/widgets/prescription_item.dart';
import 'package:pety/features/dashboard/shared/cubit/dashboard_states.dart';
import 'package:pety/features/dashboard/shared/cubit/dashobard_cubit.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/widgets/default_text_field.dart';
import 'package:pety/shared/widgets/text_button.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class AppointmentHistory extends StatelessWidget {
  final int index;
  const AppointmentHistory({super.key, required this.index});

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    DashboardCubit cubit = context.read<DashboardCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Ink(
        height: 200.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.h),
          child: Column(
            children: [
              defaultTextButton(
                text: 'Add Prescription',
                onClick: () {
                  showInfoDialog(context);
                },
              ),
              const VerticalSpace(height: 10),
              BlocBuilder<DashboardCubit, DashboardStates>(
                  builder: (context, state) {
                    if (state is ErrorGetAppointmentHistory) {
                      return Center(child: Text(state.error));
                    } else if (cubit.appointmentHistoryResponse != null) {
                      if (cubit.appointmentHistoryResponse!.data!.isEmpty) {
                        return const Center(child: Text('There are no prescriptions'));
                      }
                      return Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => PrescriptionItem(index:index),
                          separatorBuilder: (context, index) => const Divider(
                            thickness: 1,
                            color: ColorManager.dashLineColor,
                          ),
                          itemCount: cubit.appointmentHistoryResponse!.data!.length,
                        ),
                      );
                    }else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              const AddHistoryBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void showInfoDialog(BuildContext context) {
    DashboardCubit cubit = context.read<DashboardCubit>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Prescription'),
          content: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    DefaultTextField(
                      context: context,
                      controller: cubit.petNameController,
                      keyboardType: TextInputType.text,
                      label: 'Pet Name',
                      validate: (value){
                        if(value==null || !value.isNotBlank()){
                          return 'Enter pet name';
                        }
                        return null;
                      },
                    ),
                    const VerticalSpace(height: 10),
                    DefaultTextField(
                      context: context,
                      controller: cubit.petTypeController,
                      keyboardType: TextInputType.text,
                      label: 'Pet Type',
                      validate: (value){
                        if(value==null || !value.isNotBlank()){
                          return 'Enter pet type';
                        }
                        return null;
                      },
                    ),
                    const VerticalSpace(height: 10),
                    DefaultTextField(
                      context: context,
                      controller: cubit.symptomsController,
                      keyboardType: TextInputType.text,
                      label: 'Symptoms',
                      validate: (value){
                        if(value==null || !value.isNotBlank()){
                          return 'Enter pet symptoms';
                        }
                        return null;
                      },
                    ),
                    const VerticalSpace(height: 10),
                    DefaultTextField(
                      context: context,
                      controller: cubit.diagnosisController,
                      keyboardType: TextInputType.text,
                      label: 'Diagnosis',
                      validate: (value){
                        if(value==null || !value.isNotBlank()){
                          return 'Enter pet diagnosis';
                        }
                        return null;
                      },
                    ),
                    const VerticalSpace(height: 10),
                    DefaultTextField(
                      context: context,
                      controller: cubit.medicineController,
                      keyboardType: TextInputType.text,
                      label: 'Medicine',
                      validate: (value){
                        if(value==null || !value.isNotBlank()){
                          return 'Enter pet medicine';
                        }
                        return null;
                      },
                    ),
                    const VerticalSpace(height: 10),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            defaultTextButton(
              text: 'Cancel',
              onClick: () {
                context.pop();
                cubit.clearHistory();
              },
            ),
            defaultTextButton(
              text: 'Add',
              onClick: () {
                if(formKey.currentState!.validate()){
                  cubit.addHistory();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
