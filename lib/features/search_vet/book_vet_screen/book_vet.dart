
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/features/search_vet/book_vet_screen/widgets/book_vet_bloc_listener.dart';
import 'package:pety/features/search_vet/book_vet_screen/widgets/fees_location_calendar.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/features/search_vet/widgets/vet_card_details.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_app_bar.dart';
import 'package:pety/shared/widgets/default_back_app_bar.dart';
import 'package:pety/shared/widgets/default_button.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class BookVetScreen extends StatelessWidget{
  const BookVetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Booking information',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VetCardDetails(),
            const VerticalSpace(height: 40),
            //Text(context.read<SearchVetCubit>().userName,style: TextStyles.font13BlackBold,),
            const FeesLocationCalendar(),
            const VerticalSpace(height: 30),
            Align(
              alignment: AlignmentDirectional.center,
              child: DefaultButton(
                text: 'Confirm',
                textStyle: GoogleFonts.montserrat(
                  textStyle: TextStyles.font16WhiteBold
                ),
                onClick: (){
                  context.read<SearchVetCubit>().bookVet();
                },
                color: ColorManager.yellow,
                width: 140.w,
                height: 50.h,
                radius: 8,
              ),
            ),
            const BookVetBlocListener(),
          ],
        ),
      ),
    );
  }

}