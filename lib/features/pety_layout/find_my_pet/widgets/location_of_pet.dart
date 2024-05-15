
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/features/pety_layout/cubit/pet_layout_states.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_drop_down_button.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class LocationOfPet extends StatelessWidget{
  const LocationOfPet({super.key});

  @override
  Widget build(BuildContext context) {
    PetLayoutCubit cubit = context.read<PetLayoutCubit>();
    return BlocBuilder<PetLayoutCubit,PetLayoutStates>(
      builder: (context,state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location of the missing pet',
              style: GoogleFonts.montserrat(
                  textStyle:TextStyles.font12BlackSemiBold
              ),
            ),
            const VerticalSpace(height: 15),
            DefaultDropdownButton(
              value: cubit.country,
              items: cubit.countries,
              hint: 'Select country',
              onChange: (value) {
                cubit.changeLocationValue(value!,'country');
              },
              validate: (value){
                if(value==null){
                  return 'You must select a country';
                }
                return null;
              },
            ),
            const VerticalSpace(height: 15),
            DefaultDropdownButton(
              value: cubit.government,
              items: cubit.governments,
              hint: 'Select government',
              onChange: (value) {
                cubit.changeLocationValue(value!,'government');
              },
              validate: (value){
                if(value==null){
                  return 'You must select a government';
                }
                return null;
              },
            ),
            const VerticalSpace(height: 15),
            DefaultDropdownButton(
              value: cubit.city,
              items: cubit.cities,
              hint: 'Select city',
              onChange: (value) {
                cubit.changeLocationValue(value!,'city');
              },
              validate: (value){
                if(value==null){
                  return 'You must select a city';
                }
                return null;
              },
            ),
            const VerticalSpace(height: 15),
            DefaultDropdownButton(
              value: cubit.animal,
              items: cubit.animals,
              hint: 'Select animal type',
              onChange: (value) {
                cubit.changeLocationValue(value!,'animal');
              },
              validate: (value){
                if(value==null){
                  return 'You must select the animal type';
                }
                return null;
              },
            ),
          ],
        );
      }
    );
  }

}