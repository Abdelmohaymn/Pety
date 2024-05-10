
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/features/search_vet/cubit/search_vet_states.dart';
import 'package:pety/shared/constants/pety_constants.dart';
import 'package:pety/shared/network/remote/api_constants.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_radio_button.dart';

class SortOptions extends StatelessWidget {
  final BuildContext cubitContext;

  const SortOptions({
    super.key,
    required this.cubitContext
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sort by',
          style: TextStyles.font13BlackBold,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Row(
            children: [
              Expanded(child: sortByItem('Rate', SortByConstants.rate)),
              Expanded(child: sortByItem('Price', SortByConstants.price)),
              Expanded(child: sortByItem('Offers', SortByConstants.offer)),
            ],
          ),
        ),
        //FromUpperToLower(cubit: widget.cubit),
      ],
    );
  }

  Widget sortByItem(String name, String value) {
    return BlocProvider.value(
      value: BlocProvider.of<SearchVetCubit>(cubitContext),
      child: BlocBuilder<SearchVetCubit, SearchVetStates>(
        builder: (context, state) {
          final SearchVetCubit cubit = context.read<SearchVetCubit>();
          return DefaultRadioButton(
            onClick: () {
              cubit.changeSort(value);
              if (name == 'Price') {
                cubit.changeFromUpperToLower(false);
              } else if (name == 'Rate') {
                cubit.changeFromUpperToLower(true);
              }
            },
            name: name,
            value: value,
            groupValue: cubit.sort,
          );
        },
      ),
    );
  }
}