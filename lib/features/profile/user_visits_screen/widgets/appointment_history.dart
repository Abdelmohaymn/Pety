

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/profile/cubit/profile_cubit.dart';
import 'package:pety/features/profile/user_visits_screen/widgets/prescription_item.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';

class AppointmentHistory extends StatelessWidget {
  final int index;
  const AppointmentHistory({super.key, required this.index});


  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = context.read<ProfileCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Ink(
        height: 180.h,
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
              Text(
                'Prescriptions',
                style: TextStyles.font12DefaultRegular,
              ),
              if(!cubit.userVisits!.data![index].hasHistory!)
                const Center(
                  child: Text('There are no prescriptions'),
                ),
              if(cubit.userVisits!.data![index].hasHistory!)
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => PrescriptionItem(index:index),
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
                      color: ColorManager.dashLineColor,
                    ),
                    itemCount: cubit.userVisits!.data![index].history!.length,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

}
