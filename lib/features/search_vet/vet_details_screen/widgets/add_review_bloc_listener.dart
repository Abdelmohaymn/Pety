
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/register/cubit/register_cubit.dart';
import 'package:pety/features/register/cubit/register_states.dart';
import 'package:pety/features/register/data/models/register_response.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/features/search_vet/cubit/search_vet_states.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/network/local/shared_pred_constants.dart';
import 'package:pety/shared/network/local/shared_pref_helper.dart';
import 'package:pety/shared/routing/routes.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widget_functions.dart';

class AddReviewBlocListener extends StatelessWidget{
  const AddReviewBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchVetCubit,SearchVetStates>(
      listenWhen: (previous, current){
        return current is SuccessAddReview || current is LoadingAddReview || current is ErrorAddReview;
      },
      listener: (context,state){
        state.whenOrNull(
            loadAddReview: (){
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            successAddReview: (){
              context.pop();
            },
            errorAddReview: (error){
              WidgetFunctions.setupErrorState(context, error);
            }
        );
      },
      child: const SizedBox.shrink(),
    );
  }


}