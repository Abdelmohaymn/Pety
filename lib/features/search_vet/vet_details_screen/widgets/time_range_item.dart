
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/features/search_vet/data/models/search_vets_response.dart';
import 'package:pety/shared/styles/texts.dart';

class TimeRangeItem extends StatelessWidget{

  Appointments item;
  TimeRangeItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      height: 30.h,
      child: OutlinedButton(
        onPressed: item.isAvailable!?(){
          context.read<SearchVetCubit>().moveToBookVet(context,item.time!);
        }:null,
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                )
            ),
            side: MaterialStateProperty.all(BorderSide(color: item.isAvailable!?Colors.black:Colors.grey)),
        ),
        child: Text(
          item.isAvailable!?item.time.toString():'Booked',
          style: item.isAvailable!?TextStyles.font12BlackMedium:TextStyles.font12BlackMedium.copyWith(color: Colors.grey),
        ),
      ),
    );
  }

}