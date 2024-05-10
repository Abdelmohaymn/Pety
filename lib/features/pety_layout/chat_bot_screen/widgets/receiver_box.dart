
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';

class ReceiverBox extends StatelessWidget{
  int index;
  ReceiverBox({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    PetLayoutCubit cubit = context.read<PetLayoutCubit>();
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 3/4*MediaQuery.of(context).size.width
        ),
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)
          ),

        ),
        child: Builder(
          builder: (context) {
            if(index==0&&cubit.allowAnimatedText){
              return DefaultTextStyle(
                style: TextStyles.font12BlackMedium,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      cubit.chatBotMessages[index],
                    ),
                  ],
                  displayFullTextOnTap: true,
                  isRepeatingAnimation: false,
                  onFinished: (){
                    cubit.stopAnimatedText();
                  },
                  onTap: (){
                    cubit.stopAnimatedText();
                  },
                ),
              );
            }else{
              return Text(
                cubit.chatBotMessages[index],
                style: TextStyles.font12BlackMedium,
              );
            }
          }
        ),
      ),
    );
  }
  
}