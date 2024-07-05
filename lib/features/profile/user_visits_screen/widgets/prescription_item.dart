


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/profile/cubit/profile_cubit.dart';
import 'package:pety/features/profile/user_visits_screen/widgets/info_item.dart';

class PrescriptionItem extends StatelessWidget{
  final int index;
  const PrescriptionItem({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = context.read<ProfileCubit>();

    return Column(
      children: [
        InfoItem(title: 'Pet Name', content: cubit.userVisits!.data![cubit.appointmentIndex].history![index].animalName!),
        InfoItem(title: 'Pet Type', content: cubit.userVisits!.data![cubit.appointmentIndex].history![index].animalType!),
        InfoItem(title: 'Symptoms', content: cubit.userVisits!.data![cubit.appointmentIndex].history![index].symptoms!),
        InfoItem(title: 'Diagnosis', content: cubit.userVisits!.data![cubit.appointmentIndex].history![index].diagnosisName!),
        InfoItem(title: 'Medicine', content: cubit.userVisits!.data![cubit.appointmentIndex].history![index].medicineName!),
      ],
    );
  }

}