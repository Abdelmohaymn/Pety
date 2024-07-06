import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/features/search_vet/cubit/search_vet_states.dart';
import 'package:pety/shared/constants/pety_constants.dart';
import 'package:pety/shared/styles/font_families.dart';
import 'package:pety/shared/styles/texts.dart';

class FromUpperToLower extends StatelessWidget {
  final BuildContext cubitContext;

  const FromUpperToLower({
    super.key,
    required this.cubitContext,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<SearchVetCubit>(cubitContext),
      child: BlocBuilder<SearchVetCubit, SearchVetStates>(
        builder: (context, state) {
          final SearchVetCubit cubit = context.read<SearchVetCubit>();
          return Visibility(
            visible: cubit.sort!=SortByConstants.offer,
            child: Row(
              children: [
                Text(
                  'From max to min',
                  style: TextStyles.font13BlackBold.copyWith(
                      fontFamily: FontFamilyHelper.montserrat
                  ),
                ),
                const Spacer(),
                Checkbox(
                  value: cubit.fromUpperToLower,
                  onChanged: (value) {
                    cubit.changeFromUpperToLower(value!);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}