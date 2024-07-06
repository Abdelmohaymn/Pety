
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/home/widgets/job_item_widget.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/shared/styles/font_families.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class JobsList extends StatelessWidget {

  const JobsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PetLayoutCubit cubit = context.read<PetLayoutCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Book an appointment',
          style: TextStyles.font12BlackBold.copyWith(
            fontFamily: FontFamilyHelper.montserrat
          ),
        ),
        const VerticalSpace(height: 5),
        SizedBox(
          height: 160.h,
          child: ListView.separated(
            itemBuilder: (context,index) => JobItemWidget(model:cubit.jobsList[index]),
            separatorBuilder: (context,index)=> const HorizontalSpace(width: 10),
            itemCount: cubit.jobsList.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
          ),
        ),
      ],
    );
  }

}