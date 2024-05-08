import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/pety_layout/chat_bot_screen/widgets/receiver_box.dart';
import 'package:pety/features/pety_layout/chat_bot_screen/widgets/sender_box.dart';
import 'package:pety/features/pety_layout/cubit/pet_layout_states.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/shared/constants/pety_constants.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    PetLayoutCubit cubit = context.read<PetLayoutCubit>();
    return BlocBuilder<PetLayoutCubit, PetLayoutStates>(
      builder: (context, state) {
        return Expanded(
            child: ListView.separated(
              //controller: cubit.scrollController,
              reverse: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                if (cubit.chatBotMessages[0] ==
                    ChatBotConstants.initialMessage) {
                  return ReceiverBox(index: index,);
                } else if (cubit.chatBotMessages.length & 1 == 1) {
                  if (index & 1 == 1) {
                    return ReceiverBox(index: index,);
                  } else {
                    return SenderBox(message: cubit.chatBotMessages[index],);
                  }
                } else {
                  if (index & 1 == 1) {
                    return SenderBox(message: cubit.chatBotMessages[index],);
                  } else {
                    return ReceiverBox(index: index,);
                  }
                }
              },
              separatorBuilder: (BuildContext context,
                  int index) => const VerticalSpace(height: 10),
              itemCount: cubit.chatBotMessages.length,
            )
        );
      },
    );
  }

}