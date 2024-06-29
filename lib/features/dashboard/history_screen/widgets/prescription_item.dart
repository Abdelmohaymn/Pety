
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/dashboard/history_screen/models/appointment_history_response.dart';
import 'package:pety/features/dashboard/history_screen/widgets/info_item.dart';
import 'package:pety/features/dashboard/shared/cubit/dashobard_cubit.dart';

class PrescriptionItem extends StatelessWidget{
  final int index;
  const PrescriptionItem({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    DashboardCubit cubit = context.read<DashboardCubit>();
    AppointmentHistoryResponse prescription = cubit.appointmentHistoryResponse!;

    return Column(
      children: [
        InfoItem(title: 'Pet Name', content: prescription.data![index].animalName!),
        InfoItem(title: 'Pet Type', content: prescription.data![index].animalType!),
        InfoItem(title: 'Symptoms', content: prescription.data![index].symptoms!),
        InfoItem(title: 'Diagnosis', content: prescription.data![index].diagnosisName!),
        InfoItem(title: 'Medicine', content: prescription.data![index].medicineName!),
      ],
    );
  }

}