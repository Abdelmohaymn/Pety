
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/features/pety_layout/find_my_pet/result_of_search/widgets/missing_pet_item.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/widgets/default_app_bar.dart';

class MissingPetsScreen extends StatelessWidget{
  const MissingPetsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    PetLayoutCubit cubit = context.read<PetLayoutCubit>();
    return Scaffold(
      backgroundColor: ColorManager.backgroundBlue,
      appBar: DefaultAppBar(
        title: 'Missing pets',
        onBack: (){cubit.onBackFromFindPet(context);}
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cubit.missingPets?.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: (MediaQuery.of(context).size.width) / 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 20.h
                ),
                itemBuilder: (BuildContext context, int index) {
                  return MissingPetItem(index: index);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}