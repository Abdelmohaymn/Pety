
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/features/search_vet/data/models/search_vets_response.dart';
import 'package:pety/features/search_vet/vet_details_screen/widgets/time_range_item.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class TimeRangesList extends StatelessWidget{

  final List<Appointments>? appointmentsList;
  TimeRangesList({
    super.key,
    required this.appointmentsList
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const VerticalSpace(height: 30),
        Container(
          constraints: BoxConstraints(
            maxHeight: 300.h
          ),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 90.w,
              mainAxisExtent: 30.h,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
            ),
            itemCount: appointmentsList!.length,
            itemBuilder: (BuildContext context, int index) {
              return TimeRangeItem(item: appointmentsList![index]);
            },
          ),
        ),
      ],
    );
  }

}