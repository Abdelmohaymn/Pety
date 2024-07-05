
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/features/community/community_screen/widgets/button_votes.dart';
import 'package:pety/features/community/community_screen/widgets/comments_box.dart';
import 'package:pety/features/community/community_screen/widgets/profile_image.dart';
import 'package:pety/features/community/community_screen/widgets/tag_box.dart';
import 'package:pety/features/community/shared/cubit/community_cubit.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class PostItem extends StatelessWidget{

  final int index;
  const PostItem({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    CommunityCubit cubit = context.read<CommunityCubit>();
    return Container(
      constraints: BoxConstraints(
        maxHeight: 300.h,
      ),
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ProfileImage(radius: 10,img: cubit.posts!.data![index].user!.photo!.url,),
              const HorizontalSpace(width: 4),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: 150.w
                ),
                child: Text(
                  '${cubit.posts!.data![index].user!.firstName!} ${cubit.posts!.data![index].user!.lastName!}. ',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyles.font10LightBlack2Bold
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const HorizontalSpace(width: 1),
              Text(
                cubit.posts!.data![index].createdAt!,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyles.font10LightGrey4Medium
                ),
              )
            ],
          ),
          const VerticalSpace(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: 150.h
                      ),
                      child: SingleChildScrollView(
                        child: Text(
                          cubit.posts!.data![index].context!,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyles.font16BlackRegular
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpace(height: 8),
                    const TagBox(),
                  ],
                ),
              ),
              if(cubit.posts!.data![index].photo!=null)
                Image(
                    width: 100.w,
                    height: 100.h,
                    image: NetworkImage(cubit.posts!.data![index].photo!.url!)
                )
            ],
          ),
          const VerticalSpace(height: 10),
          Row(
            children: [
              ButtonVotes(index: index,),
              const HorizontalSpace(width: 10),
              const CommentsBox()
            ],
          )
        ],
      ),
    );
  }

}