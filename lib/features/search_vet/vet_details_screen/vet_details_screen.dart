
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/features/search_vet/vet_details_screen/widgets/appointments_list.dart';
import 'package:pety/features/search_vet/vet_details_screen/widgets/location_and_fees.dart';
import 'package:pety/features/search_vet/vet_details_screen/widgets/reviews_list.dart';
import 'package:pety/features/search_vet/widgets/vet_card_details.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_back_app_bar.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class VetDetailsScreen extends StatelessWidget{

  const VetDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchVetCubit>();
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop){
        if(didPop)return;
        cubit.onBackPressedFromDetails(context);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: DefaultBackAppBar(context: context,onBack: (){cubit.onBackPressedFromDetails(context);},),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                  onTap: (){
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Ink(
                      width: 30,
                      height: 30,
                      child: Center(child: SvgPicture.asset('assets/svgs/share_icon.svg',width: 20,height: 20,))
                  )
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VetCardDetails(),
                const VerticalSpace(height: 20),
                const LocationAndFees(),
                const VerticalSpace(height: 30),
                const AppointmentsList(),
                const VerticalSpace(height: 30),
                Text(
                  'About vet',
                  style: TextStyles.font12BlackSemiBold,
                ),
                Text(
                  cubit.chosenVet!.description!,
                  //'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly bel middle of text.',
                  style: TextStyles.font12DefaultRegular,
                ),
                const VerticalSpace(height: 30),
                const ReviewsList(),
                const VerticalSpace(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

}