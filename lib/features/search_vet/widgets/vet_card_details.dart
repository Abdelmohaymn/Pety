
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_rating_indicator.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class VetCardDetails extends StatelessWidget{
  const VetCardDetails({super.key});

  @override
  Widget build(BuildContext context) {

    SearchVetCubit cubit = context.read<SearchVetCubit>();
    return SizedBox(
      width: double.infinity,
      height: 100.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: vetImage(cubit.chosenVet!.photo?.url),
          ),
          const HorizontalSpace(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    cubit.chosenVet!.petyName!,
                    style: GoogleFonts.fredoka(
                      textStyle: TextStyles.font16BlackSemiBold
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    DefaultRatingIndicator(rate: cubit.chosenVet!.ratingsAverage!.toDouble(),),
                    const HorizontalSpace(width: 3),
                    Text(
                      '(${cubit.chosenVet!.ratingsAverage!.toString()})',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyles.font12DefaultSemiBold
                      ),
                    ),
                  ],
                ),
                Text(
                  'Role: ${cubit.chosenVet!.role!}',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyles.font12BlackMedium
                  ),
                ),
                Text(
                  cubit.chosenVet!.animals==null?'':cubit.chosenVet!.animals!.toStringCustom(' - '),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyles.font12LightGrey5Medium
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
    
  }

  Widget vetImage(String? image){
    if(image!=null){
      return Image.network(
        image,
        height: 100.h,
        width: 80.w,
        fit: BoxFit.cover,
        //image: const NetworkImage(),
      );
    }
    return Image.asset(
      'assets/images/default_vet_image.jpg',
      height: 100.h,
      width: 80.w,
      fit: BoxFit.cover,
    );
  }

}