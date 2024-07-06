
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/features/search_vet/cubit/search_vet_states.dart';
import 'package:pety/features/search_vet/vet_details_screen/widgets/post_review.dart';
import 'package:pety/features/search_vet/vet_details_screen/widgets/review_item.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/font_families.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class ReviewsList extends StatelessWidget{
  const ReviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews',
          style: TextStyles.font12BlackSemiBold.copyWith(
            fontFamily: FontFamilyHelper.montserrat
          ),
        ),
        const VerticalSpace(height: 20),
        BlocBuilder<SearchVetCubit,SearchVetStates>(
            builder: (context,state){
              SearchVetCubit cubit = context.read<SearchVetCubit>();
              if(cubit.reviews==null){
                return const Center(
                  child: Text('There are no reviews'),
                );
              }else{
                return ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index) {
                      return ReviewItem(index: index);
                    },
                    separatorBuilder: (context,index) => const Divider(thickness: 1,color: ColorManager.dashLineColor,),
                    itemCount: cubit.reviews!.length
                );
              }
            }
        ),
        const VerticalSpace(height: 50),
        PostReview(),
      ],
    );
  }

}