
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/features/search_vet/vet_details_screen/widgets/add_review_bloc_listener.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_button.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class PostReview extends StatelessWidget{
  PostReview({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'How was your experience?',
          style: GoogleFonts.montserrat(
            textStyle: TextStyles.font16BlackBold
          ),
        ),
        RatingBar.builder(
          initialRating: context.read<SearchVetCubit>().initialRate,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            context.read<SearchVetCubit>().changeReviewRate(rating);
          },
        ),
        const VerticalSpace(height: 10),
        Form(
          key: formKey,
          child: SizedBox(
            height: 80.h,
            child: TextFormField(
              controller: context.read<SearchVetCubit>().reviewController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide(width: 1)),
                hintText: 'Describe your experience',
                hintStyle: GoogleFonts.montserrat(
                  textStyle: TextStyles.font12LightGreyMedium
                )
              ),
              validator: (value){
                if(value==null||!value.isNotBlank()){
                  return 'You have to write your experience';
                }
                return null;
              },
            ),
          ),
        ),
        const VerticalSpace(height: 10),
        DefaultButton(
          radius: 5,
          width: double.infinity,
          height: 50.h,
          color: ColorManager.orange,
          textStyle: TextStyles.font16WhiteBold,
          text: 'Post Review',
          onClick: (){
            if(formKey.currentState!.validate()){
              context.read<SearchVetCubit>().addNewReview();
            }
          }
        ),
        const AddReviewBlocListener()
      ],
    );
  }

}