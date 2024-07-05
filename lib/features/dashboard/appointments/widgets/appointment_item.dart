import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/features/dashboard/appointments/models/appointment_status_body.dart';
import 'package:pety/features/dashboard/appointments/models/appointments_response.dart';
import 'package:pety/features/dashboard/shared/cubit/dashboard_states.dart';
import 'package:pety/features/dashboard/shared/cubit/dashobard_cubit.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/routing/routes.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';
import 'package:pety/shared/widgets/text_button.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class AppointmentItem extends StatelessWidget {
  final int index;
  const AppointmentItem({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    DashboardCubit cubit = context.read<DashboardCubit>();
    Data appointment = cubit.appointmentsResponse!.data![index];
    return Ink(
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
                appointment.owner![0].photo!.url!,
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
                  "${appointment.owner![0].firstName!} ${appointment.owner![0].lastName!}",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyles.font12BlackBold
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const VerticalSpace(height: 1),
                Text(
                  appointment.date!,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyles.font12filtersGreyColorRegular
                  ),
                ),
                Text(
                  appointment.time!,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyles.font12filtersGreyColorRegular
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<DashboardCubit,DashboardStates>(
              builder: (context,state) {
                if(appointment.status!='Pending'){
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      appointment.status!,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyles.font12BlackRegular.copyWith(color: statusColor(appointment.status!))
                      ),
                    ),
                  );
                }else if(state is ChangeAppointmentsStatusLoading && cubit.appointmentIndexOfAppointments==index){
                  return Container(
                    padding: const EdgeInsets.only(right: 6),
                    width: 25,
                    height: 25,
                    child: const CircularProgressIndicator(strokeWidth: 2,),
                  );
                }else if(state is ChangeAppointmentsStatusSuccess && cubit.appointmentIndexOfAppointments==index){
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      state.data.data.status,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyles.font12BlackRegular.copyWith(color: statusColor(state.data.data.status))
                      )
                    ),
                  );
                }
                else {
                  return Row(
                    children: [
                      defaultTextButton(
                          text: 'Approve',
                          color: ColorManager.defaultColor,
                          onClick: () {
                            cubit.changeAppointmentStatus(index: index,status: 'approved');
                          }
                      ),
                      defaultTextButton(
                          text: 'Reject',
                          color: Colors.redAccent,
                          onClick: () {
                            cubit.changeAppointmentStatus(index: index,status: 'rejected');
                          }
                      ),
                    ],
                  );
                }
              }
          ),
          InkWell(
            onTap: (){
              Map<String,dynamic> mp={};
              mp['cubitContext']=context;
              mp['id']=appointment.owner![0].id!;
              context.pushNamed(Routes.dashboardHistoryAppointment, arguments:mp);
            },
            borderRadius: BorderRadius.circular(25),
            child: SvgPicture.asset('assets/svgs/history.svg')
          )
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