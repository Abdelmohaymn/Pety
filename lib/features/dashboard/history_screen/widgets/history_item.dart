


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/dashboard/history_screen/widgets/appointment_history.dart';
import 'package:pety/features/dashboard/shared/cubit/dashobard_cubit.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class HistoryItem extends StatefulWidget {

  final int index;
  const HistoryItem({super.key,required this.index});

  @override
  State<HistoryItem> createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {

  bool clicked=false;


  @override
  Widget build(BuildContext context) {
    DashboardCubit cubit = context.read<DashboardCubit>();
    var appointment = cubit.userHistoryResponse!.data!.appointments![widget.index];
    var user = cubit.userHistoryResponse!.user!;

    return InkWell(
      onTap:(){
        setState(() {
          cubit.appointmentHistoryResponse=null;
          if(!clicked){
            cubit.getAppointmentHistory(appointment.id!);
            cubit.appointmentIndexOfHistory=widget.index;
          }
          clicked=!clicked;
        });
      },
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          Ink(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            height: 120.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Image border
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(40), // Image radius
                    child: Image.network(
                        user.owner!.photo!.url!,
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                const HorizontalSpace(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${user.owner!.firstName!} ${user.owner!.lastName!}",
                        style: TextStyles.font12BlackBold.copyWith(
                          fontFamily: "Montserrat"
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const VerticalSpace(height: 1),
                      Text(
                        appointment.date!,
                        style: TextStyles.font12filtersGreyColorRegular.copyWith(
                            fontFamily: "Montserrat"
                        ),
                      ),
                      Text(
                        appointment.time!,
                        style: TextStyles.font12filtersGreyColorRegular.copyWith(
                            fontFamily: "Montserrat"
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  appointment.status!,
                  style: TextStyles.font12BlackRegular.copyWith(color: statusColor(appointment.status!)),
                ),
              ],
            ),
          ),
          if(clicked&&widget.index==cubit.appointmentIndexOfHistory)
            AppointmentHistory(index:widget.index),
        ],
      ),
    );
  }

  Color statusColor(String status){
    switch(status){
      case 'Approved': return ColorManager.defaultColor;
      case 'Rejected': return Colors.redAccent;
      default : return ColorManager.defaultColor;
    }
  }

}