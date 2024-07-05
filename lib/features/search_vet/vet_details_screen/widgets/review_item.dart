
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/circle_avatar_default_image.dart';
import 'package:pety/shared/widgets/default_rating_indicator.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class ReviewItem extends StatelessWidget{
  final int index;
  ReviewItem({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    SearchVetCubit cubit = context.read<SearchVetCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatarDefaultImage(
              imageUrl: cubit.reviews?[index].user?.photo?.url,
              radius: 25,
            ),
            const HorizontalSpace(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${cubit.reviews?[index].user?.firstName} ${cubit.reviews?[index].user?.lastName}',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyles.font13BlackBold
                  ),
                ),
                DefaultRatingIndicator(rate: cubit.reviews![index].rating!.toDouble())
              ],
            ),
            const Spacer(),
            Text(
              cubit.reviews![index].createdAt!,
              style: GoogleFonts.montserrat(
                textStyle: TextStyles.font12GreyLight
              ),
            )
          ],
        ),
        const VerticalSpace(height: 20),
        Text(
          cubit.reviews![index].review!,
          style: GoogleFonts.montserrat(
            textStyle: TextStyles.font12BlackRegular
          ),
        )
      ],
    );
  }

}