
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/home/widgets/be_a_vet_card.dart';
import 'package:pety/features/home/widgets/community_card.dart';
import 'package:pety/features/home/widgets/find_my_pet_cards.dart';
import 'package:pety/features/home/widgets/jobs_list.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:10.w,vertical: 10.h),
          child: const Column(
            children: [
              CommunityCard(),
              VerticalSpace(height: 30),
              JobsList(),
              FindMyPetCards(),
              VerticalSpace(height: 30),
              BeAVetCard(),
              VerticalSpace(height: 30),
            ],
          ),
        ),
      ),
    );
  }


}