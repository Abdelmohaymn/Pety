

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/profile/cubit/profile_cubit.dart';
import 'package:pety/features/profile/cubit/profile_states.dart';
import 'package:pety/features/profile/user_visits_screen/widgets/visit_item.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/widgets/default_app_bar.dart';
import 'package:pety/shared/widgets/default_back_app_bar.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class UserVisitsScreen extends StatelessWidget {

  const UserVisitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = context.read<ProfileCubit>();
    return Scaffold(
      backgroundColor: ColorManager.backgroundBlue,
      appBar: const DefaultAppBar(
        title: 'Visits',
      ),
      body: BlocBuilder<ProfileCubit, ProfileStates>(
        builder: (context, state) {
          if(state is UserVisitsError){
            return Center(
                child: Text(state.error)
            );
          }else if(cubit.userVisits!=null) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => VisitItem(index: index),
                          separatorBuilder: (context, index) => const VerticalSpace(height: 10),
                          itemCount: cubit.userVisits!.data!.length
                      )
                  ),
                ],
              ),
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

}