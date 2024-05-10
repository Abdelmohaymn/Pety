
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/styles/colors.dart';

class SendMessageButton extends StatelessWidget{
  const SendMessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    PetLayoutCubit cubit = context.read<PetLayoutCubit>();
    return InkWell(
      onTap: () {
        if(cubit.chatController.text.isNotBlank()){
          cubit.predictForChatBot();
        }
      },
      borderRadius: BorderRadius.circular(25),
      child: Ink(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: ColorManager.orange
        ),
        child: const Icon(Icons.send,color: Colors.white,),
      ),
    );
  }

}