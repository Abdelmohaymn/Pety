
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/features/search_vet/cubit/search_vet_states.dart';
import 'package:pety/shared/styles/texts.dart';

class AnimalsOptions extends StatelessWidget {

  final BuildContext cubitContext;

  const AnimalsOptions({super.key, required this.cubitContext});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Animals',
          style: GoogleFonts.inter(
              textStyle: TextStyles.font16BlackSemiBold
          ),
        ),
        SizedBox(
          height: 80,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100.w),
            itemCount: cubitContext.read<SearchVetCubit>().animals.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  BlocProvider.value(
                    value: BlocProvider.of<SearchVetCubit>(cubitContext),
                    child: BlocBuilder<SearchVetCubit, SearchVetStates>(
                      builder: (context, state) {
                        return Checkbox(
                            value: cubitContext.read<SearchVetCubit>().animals[index].isSelected,
                            onChanged: (value) {
                              cubitContext.read<SearchVetCubit>().changeAnimalSelection(index,value!);
                            }
                        );
                      },
                    ),
                  ),
                  Text(
                    cubitContext.read<SearchVetCubit>().animals[index].name,
                    style: TextStyles.font12filtersGreyColorRegular,
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}