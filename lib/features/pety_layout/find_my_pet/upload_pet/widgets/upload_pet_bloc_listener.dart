
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/pety_layout/cubit/pet_layout_states.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/widget_functions.dart';

class UploadPetBlocListener extends StatelessWidget{
  const UploadPetBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PetLayoutCubit,PetLayoutStates>(
      listenWhen: (previous, current){
        return current is SuccessRegisterPet || current is LoadingRegisterPet || current is ErrorRegisterPet;
      },
      listener: (context,state){
        state.whenOrNull(
            loadRegisterPet: (){
              showDialog(
                barrierDismissible:false,
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            successRegisterPet: (){
              context.pop();
              if(context.read<PetLayoutCubit>().uploadPet){
                WidgetFunctions.showSuccessSnackBar(context,'Registered successfully');
              }else{
                WidgetFunctions.showErrorSnackBar(context,'Something went wrong. Try again');
              }
            },
            errorRegisterPet: (error){
              WidgetFunctions.setupErrorState(context, error);
            }
        );
      },
      child: const SizedBox.shrink(),
    );
  }


}