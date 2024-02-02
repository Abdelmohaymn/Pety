
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/home/widgets/job_item_widget.dart';
import 'package:pety/layouts/pety_layout/cubit/pety_layout_cubit.dart';

class JobsList extends StatelessWidget {

  final PetLayoutCubit cubit;
  const JobsList({
    super.key,
    required this.cubit
  });

  @override
  Widget build(BuildContext context) {
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