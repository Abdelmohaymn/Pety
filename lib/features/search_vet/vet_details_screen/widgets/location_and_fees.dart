
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';

class LocationAndFees extends StatelessWidget{
  const LocationAndFees({super.key});

  @override
  Widget build(BuildContext context) {

    SearchVetCubit cubit = context.read<SearchVetCubit>();

    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage('assets/images/dollar.png'),
                width: 32.w,
                height: 32.h,
              ),
              const HorizontalSpace(width: 5),
              Text(
                cubit.chosenVet!.price!.toString(),
                style: TextStyles.font12LightGreyRegular,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage('assets/images/location.png'),
                width: 32.w,
                height: 32.h,
              ),
              const HorizontalSpace(width: 5),
              Expanded(
                child: Text(
                  cubit.chosenVet!.address!,
                  style: TextStyles.font12LightGreyRegular,
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}