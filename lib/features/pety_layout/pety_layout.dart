
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/features/pety_layout/cubit/pet_layout_states.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/routing/routes.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';

class PetLayout extends StatelessWidget{
  const PetLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetLayoutCubit,PetLayoutStates>(
      builder: (BuildContext context, PetLayoutStates state) {
        PetLayoutCubit cubit = context.read<PetLayoutCubit>();
        return Scaffold(
          appBar: cubit.titles[cubit.currentIndex],
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavIndex(index);
            },
            selectedLabelStyle: TextStyles.font10LightBlue3Bold.copyWith(
              fontFamily: "Montserrat"
            ),
            unselectedLabelStyle: TextStyles.font10LightBlue3Bold.copyWith(
              color: Colors.black.withOpacity(0.25),
              fontFamily: "Montserrat"
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {context.pushNamed(Routes.chatBotScreen,arguments: context);},
            backgroundColor: ColorManager.backgroundBlue,
            shape: const CircleBorder(),
            child: const Image(
              width: 30,
              height: 30,
              image: AssetImage('assets/images/chatbot.png'),
            ),
          ),
          backgroundColor: ColorManager.backgroundBlue,
        );
      },
    );

  }

}