


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/community/shared/cubit/community_cubit.dart';
import 'package:pety/features/community/shared/cubit/community_states.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/widget_functions.dart';

class AddPostListener extends StatelessWidget{
  const AddPostListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommunityCubit,CommunityStates>(
      listenWhen: (previous, current){
        return current is SuccessAddPost || current is LoadAddPost || current is ErrorAddPost;
      },
      listener: (context,state){
        state.whenOrNull(
            loadAddPost: (){
              showDialog(
                barrierDismissible:false,
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            successAddPost: (){
              context.pop();
              WidgetFunctions.showSuccessSnackBar(context,'Post created successfully');
              context.pop();
              context.read<CommunityCubit>().onBackFromAddPost();
            },
            errorAddPost: (error){
              WidgetFunctions.setupErrorState(context, error);
            }
        );
      },
      child: const SizedBox.shrink(),
    );
  }


}