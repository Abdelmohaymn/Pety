
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/search_vet/search_for_vet/cubit/search_vet_cubit.dart';
import 'package:pety/features/search_vet/search_for_vet/cubit/search_vet_states.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/styles/texts.dart';

class VetNameAndOffers extends StatelessWidget{

  final BuildContext cubitContext;
  const VetNameAndOffers({
    super.key,
    required this.cubitContext
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(cubitContext.read<SearchVetCubit>().searchController.text.isNotBlank())
          Row(
            children: [
              Text(
                'Vet name: ',
                style: TextStyles.font13BlackBold,
              ),
              Expanded(
                child: Text(
                  cubitContext.read<SearchVetCubit>().searchController.text,
                  style: TextStyles.font12filtersGreyColorRegular,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        Row(
          children: [
            Text(
              'Are you searching for offers?',
              style: TextStyles.font13BlackBold,
            ),
            const Spacer(),
            BlocProvider.value(
              value: BlocProvider.of<SearchVetCubit>(cubitContext),
              child: BlocBuilder<SearchVetCubit, SearchVetStates>(
                builder: (context, state) {
                  final SearchVetCubit cubit = context.read<SearchVetCubit>();
                  return Checkbox(
                    value: cubit.offers,
                    onChanged: (value){
                      cubit.changeOffersValue(value!);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}