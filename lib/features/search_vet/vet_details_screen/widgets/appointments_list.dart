
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/features/search_vet/cubit/search_vet_states.dart';
import 'package:pety/features/search_vet/vet_details_screen/widgets/appointment_item.dart';
import 'package:pety/features/search_vet/vet_details_screen/widgets/time_ranges_list.dart';
import 'package:pety/shared/styles/font_families.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class AppointmentsList extends StatelessWidget{
  const AppointmentsList({super.key});

  @override
  Widget build(BuildContext context) {

    SearchVetCubit cubit = context.read<SearchVetCubit>();

    return BlocProvider.value(
      value: BlocProvider.of<SearchVetCubit>(context),
      child: BlocBuilder<SearchVetCubit,SearchVetStates>(
          builder: (context,state){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose your appointment',
                  style: TextStyles.font12BlackMedium.copyWith(
                    fontFamily: FontFamilyHelper.montserrat
                  ),
                ),
                const VerticalSpace(height: 10),
                SizedBox(
                  height: 80.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return AppointmentItem(index: index);
                    },
                    separatorBuilder: (BuildContext context, int index) => const HorizontalSpace(width: 5),
                    itemCount: cubit.chosenVet!.availabilityFormatted!.length,
                  ),
                ),
                Visibility(
                  visible: cubit.clickedAppointment!=-1,
                  child: cubit.clickedAppointment!=-1?TimeRangesList(appointmentsList: cubit.chosenVet!.availabilityFormatted![cubit.clickedAppointment].appointments,):const Center(),
                )

              ],
            );
          }
      ),
    );
  }

}