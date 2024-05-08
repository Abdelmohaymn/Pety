
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/home/widgets/job_item_widget.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';

class JobsList extends StatelessWidget {

  const JobsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PetLayoutCubit cubit = context.read<PetLayoutCubit>();
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        itemBuilder: (context,index) => JobItemWidget(model:cubit.jobsList[index]),
        separatorBuilder: (context,index)=> SizedBox(width: 10.w,),
        itemCount: cubit.jobsList.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }

}