
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/features/pety_layout/cubit/pet_layout_states.dart';
import 'package:pety/shared/styles/colors.dart';

class PetLayout extends StatelessWidget{
  const PetLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetLayoutCubit,PetLayoutStates>(
      builder: (BuildContext context, PetLayoutStates state) {
        PetLayoutCubit cubit = PetLayoutCubit.get(context);
        return Scaffold(
          appBar: cubit.titles[cubit.currentIndex],
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavIndex(index);
            },
          ),
          backgroundColor: ColorManager.homeBackground,
        );
      },
    );

  }

}