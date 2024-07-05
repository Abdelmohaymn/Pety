
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class FeesLocationCalendar extends StatelessWidget{
  const FeesLocationCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    SearchVetCubit cubit = context.read<SearchVetCubit>();
    return Column(
      children: [
        Row(
          children: [
            Image(
              image: const AssetImage('assets/images/location.png'),
              width: 32.w,
              height: 32.h,
            ),
            const HorizontalSpace(width: 10),
            Expanded(
              child: Text(
                cubit.chosenVet!.address!,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyles.font16LightGreyMedium
                ),
                maxLines: 3,
              ),
            ),
          ],
        ),
        const VerticalSpace(height: 20),
        Row(
          children: [
            Image(
              image: const AssetImage('assets/images/calender.png'),
              width: 32.w,
              height: 32.h,
            ),
            const HorizontalSpace(width: 20),
            Expanded(
              child: Text(
                '${cubit.chosenTime}\n${cubit.chosenVet!.availabilityFormatted![cubit.clickedAppointment].formate2Date}',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyles.font16LightGreyMedium
                ),
                maxLines: 3,
              ),
            ),
          ],
        ),
        const VerticalSpace(height: 10),
        Row(
          children: [
            Image(
              image: const AssetImage('assets/images/money.png'),
              width: 32.w,
              height: 32.h,
            ),
            const HorizontalSpace(width: 20),
            Text(
              '${cubit.chosenVet!.price!.toString()} EGP',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyles.font16LightGreyMedium
              ),
            ),
          ],
        ),
      ],
    );
  }

}