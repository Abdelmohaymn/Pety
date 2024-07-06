import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/features/search_vet/cubit/search_vet_states.dart';
import 'package:pety/shared/constants/constant_numbers.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/font_families.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class PriceFilters extends StatelessWidget {
  final BuildContext cubitContext;

  const PriceFilters({
    super.key,
    required this.cubitContext
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price range',
          style: TextStyles.font13BlackBold.copyWith(
              fontFamily: FontFamilyHelper.montserrat
          ),
        ),
        const VerticalSpace(height: 50),
        BlocProvider.value(
          value: BlocProvider.of<SearchVetCubit>(cubitContext),
          child: BlocBuilder<SearchVetCubit, SearchVetStates>(
            builder: (context, state) {
              final SearchVetCubit cubit = context.read<SearchVetCubit>();
              return SliderTheme(
                data: SliderThemeData(
                  valueIndicatorColor: ColorManager.defaultColor,
                  rangeValueIndicatorShape: const PaddleRangeSliderValueIndicatorShape(),
                  valueIndicatorTextStyle: TextStyles.font10WhiteRegular,
                ),
                child: RangeSlider(
                    values: RangeValues(
                      cubit.minPrice.toDouble(), cubit.maxPrice.toDouble()),
                      min: ConstantNumbers.minRangeSlider,
                      max: ConstantNumbers.maxRangeSlider,
                      divisions: 10,
                      labels: RangeLabels(
                          cubit.minPrice.toString(), cubit.maxPrice.toString()),
                      onChanged: (newValues) {
                        cubit.changePriceRanges(newValues);
                      }),
              );
            },
          ),
        ),
        const VerticalSpace(height: 10),
      ],
    );
  }
}
