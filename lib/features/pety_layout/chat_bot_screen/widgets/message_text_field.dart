
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/styles/texts.dart';

class MessageTextField extends StatelessWidget{
  const MessageTextField({super.key});

  @override
  Widget build(BuildContext context) {
    PetLayoutCubit cubit = context.read<PetLayoutCubit>();
    return Expanded(
      child: Container(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height/5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          //border: Border.all(width: 0.5,color: ColorManager.defaultColor),
        ),
        child: TextFormField(
          controller: cubit.chatController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          textInputAction: TextInputAction.newline,
          decoration: InputDecoration.collapsed(
            hintText: 'Ask anything...',
            hintStyle: TextStyles.font14GreyLight,
          ),
          onFieldSubmitted: (value){
            if(value.isNotBlank()){
              cubit.predictForChatBot();
            }
          },
          onTapOutside: (value){
            FocusScope.of(context).requestFocus(FocusNode());
          },
        ),
      ),
    );
  }

}