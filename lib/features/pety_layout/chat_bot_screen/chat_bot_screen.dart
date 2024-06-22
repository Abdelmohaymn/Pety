
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pety/features/pety_layout/chat_bot_screen/widgets/message_text_field.dart';
import 'package:pety/features/pety_layout/chat_bot_screen/widgets/messages_list.dart';
import 'package:pety/features/pety_layout/chat_bot_screen/widgets/receiver_box.dart';
import 'package:pety/features/pety_layout/chat_bot_screen/widgets/send_message_button.dart';
import 'package:pety/features/pety_layout/chat_bot_screen/widgets/sender_box.dart';
import 'package:pety/features/pety_layout/cubit/pet_layout_states.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/shared/constants/pety_constants.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_back_app_bar.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';
import 'package:pety/shared/widgets/text_button.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class ChatBotScreen extends StatelessWidget{
  const ChatBotScreen({super.key});


  @override
  Widget build(BuildContext context) {
    PetLayoutCubit cubit = context.read<PetLayoutCubit>();
    return Scaffold(
      backgroundColor: ColorManager.backgroundBlue,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorManager.defaultColor,
        ),
        elevation: 2.5,
        shadowColor: Colors.black,
        backgroundColor: ColorManager.defaultColor,
        leadingWidth: double.infinity,
        leading: Row(
          children: [
            const SizedBox(width: 3,),
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(20),
              child: const Center(
                widthFactor: 1.1,
                heightFactor: 1.2,
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white,),
                    SizedBox(width: 3,),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/pet_prof.png'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 3,),
            Text(
              'PetBot',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyles.font16WhiteBold.copyWith(fontSize: 18.sp)
              ),
            )
          ],
        ),
        actions: [
          InkWell(
            onTap: (){
              cubit.clearChat();
            },
              borderRadius: BorderRadius.circular(20),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.cleaning_services_rounded,color: Colors.white),
            )
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const MessagesList(),
              const VerticalSpace(height: 5),
              BlocBuilder<PetLayoutCubit,PetLayoutStates>(
                builder: (context, state){
                  if(state is LoadingChatBotMessages){
                    return LoadingAnimationWidget.stretchedDots(
                        color: ColorManager.defaultColor,
                        size: 50
                    );
                  }else if(state is ErrorChatBotMessages){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Something went wrong.',style: TextStyles.font14WhiteRegular,),
                        defaultTextButton(
                          text: 'Try again',
                          onClick: () {
                            cubit.predictForChatBot();
                          },
                          color: ColorManager.defaultColor
                        )
                      ],
                    );
                  }else{
                    return const Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          MessageTextField(),
                          HorizontalSpace(width: 5),
                          SendMessageButton()
                        ],
                      ),
                    );
                  }
                }
              ),

            ],
          ),
        ),
    );
  }

}