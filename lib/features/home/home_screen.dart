
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/home/widgets/be_a_vet_card.dart';
import 'package:pety/features/home/widgets/find_my_pet_cards.dart';
import 'package:pety/features/home/widgets/jobs_list.dart';
import 'package:pety/features/home/widgets/know_about_community.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PetLayoutCubit cubit = context.read<PetLayoutCubit>();

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:10.w,vertical: 10.h),
          child: const Column(
            children: [
              JobsList(),
              VerticalSpace(height: 30),
              KnowAboutCommunity(),
              VerticalSpace(height: 30),
              FindMyPetCards(),
              VerticalSpace(height: 30),
              BeAVetCard(),
            ],
          ),
        ),
      ),
    );
  }


}