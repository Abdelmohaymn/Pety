

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/profile/cubit/profile_cubit.dart';
import 'package:pety/features/profile/user_visits_screen/widgets/appointment_history.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/font_families.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class VisitItem extends StatefulWidget {

  final int index;
  const VisitItem({super.key,required this.index});

  @override
  State<VisitItem> createState() => _VisitItemState();
}

class _VisitItemState extends State<VisitItem> {

  bool clicked=false;


  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = context.read<ProfileCubit>();
    var appointment = cubit.userVisits!.data![widget.index];
    var user = cubit.userVisits!.data![widget.index].petyID!;

    return InkWell(
      onTap:(){
        setState(() {
          if(!clicked){
            cubit.appointmentIndex=widget.index;
          }
          clicked=!clicked;
        });
      },
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          Ink(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            height: 100.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              children: [
                const HorizontalSpace(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.petyName!,
                        style: TextStyles.font12BlackBold.copyWith(
                          fontFamily: FontFamilyHelper.montserrat
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const VerticalSpace(height: 1),
                      Text(
                        user.role!,
                        style: TextStyles.font12BlackMedium.copyWith(
                            fontFamily: FontFamilyHelper.montserrat
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const VerticalSpace(height: 1),
                      Text(
                        appointment.date!,
                        style: TextStyles.font12filtersGreyColorRegular.copyWith(
                            fontFamily: FontFamilyHelper.montserrat
                        ),
                      ),
                      Text(
                        appointment.time!,
                        style: TextStyles.font12filtersGreyColorRegular.copyWith(
                            fontFamily: FontFamilyHelper.montserrat
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                      appointment.status!,
                      style: TextStyles.font12BlackRegular.copyWith(
                        color: statusColor(appointment.status!),
                        fontFamily: FontFamilyHelper.montserrat
                      )
                  ),
                ),
              ],
            ),
          ),
          if(clicked&&widget.index==cubit.appointmentIndex)
            AppointmentHistory(index:widget.index),
        ],
      ),
    );
  }

  Color statusColor(String status){
    switch(status){
      case 'approved': return ColorManager.defaultColor;
      case 'rejected': return Colors.redAccent;
      default : return ColorManager.defaultColor;
    }
  }

}