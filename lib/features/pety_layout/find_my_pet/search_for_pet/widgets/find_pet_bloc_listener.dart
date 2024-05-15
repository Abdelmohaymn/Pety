
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/pety_layout/cubit/pet_layout_states.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/features/pety_layout/find_my_pet/models/find_pet_response.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/routing/routes.dart';
import 'package:pety/shared/widget_functions.dart';

class FindPetBlocListener extends StatelessWidget{
  const FindPetBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PetLayoutCubit,PetLayoutStates>(
      listenWhen: (previous, current){
        return current is SuccessFindPet || current is LoadingFindPet || current is ErrorFindPet;
      },
      listener: (context,state){
        state.whenOrNull(
            loadFindPet: (){
              showDialog(
                barrierDismissible:false,
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            successFindPet: (data){
              context.pop();
              data = data as FindPetResponse;
              if(data.data!=null && data.data!.isNotEmpty){
                context.pushNamed(Routes.missingPetsScreen,arguments: context);
              }else{
                WidgetFunctions.showErrorSnackBar(context, 'No pets found');
              }
            },
            errorFindPet: (error){
              WidgetFunctions.setupErrorState(context, error);
            }
        );
      },
      child: const SizedBox.shrink(),
    );
  }


}