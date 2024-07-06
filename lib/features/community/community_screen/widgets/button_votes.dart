
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pety/features/community/shared/cubit/community_cubit.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/font_families.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';

class ButtonVotes extends StatefulWidget{
  final int index;
  const ButtonVotes({super.key,required this.index});

  @override
  State<ButtonVotes> createState() => _ButtonVotesState();
}

class _ButtonVotesState extends State<ButtonVotes> {
  bool upvote=false;
  bool downvote=false;

  @override
  void initState() {
    super.initState();
    CommunityCubit cubit = context.read<CommunityCubit>();
    upvote=cubit.posts!.data![widget.index].upvotes!.contains(cubit.userId!);
    downvote=cubit.posts!.data![widget.index].downvotes!.contains(cubit.userId!);
  }

  @override
  Widget build(BuildContext context) {
    CommunityCubit cubit = context.read<CommunityCubit>();

    return Container(
      height: 35.h,
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
      decoration: BoxDecoration(
        color:  upvote?ColorManager.defaultColor:downvote?ColorManager.red:ColorManager.black5Ops,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            InkWell(
              onTap: (){
                upvote=!upvote;
                if(upvote){
                  if(downvote){
                    cubit.posts!.data![widget.index].votes=cubit.posts!.data![widget.index].votes!+1;
                  }
                  downvote=false;
                  cubit.upVotePost(index: widget.index);
                  cubit.posts!.data![widget.index].votes=cubit.posts!.data![widget.index].votes!+1;
                }else{
                  cubit.resetVotePost(index: widget.index);
                  cubit.posts!.data![widget.index].votes=cubit.posts!.data![widget.index].votes!-1;
                }
                setState(() {});
              },
              child: SvgPicture.asset(
                'assets/svgs/${upvote?'upvote_full':'upvote'}.svg',
                width: 15,
                color: upvote||downvote?Colors.white:Colors.black,
              )
            ),
            const HorizontalSpace(width: 10),
            Text(
              cubit.posts!.data![widget.index].votes!.toString(),
              style: TextStyles.font12BlackRegular.copyWith(
                color: (upvote||downvote)?Colors.white:Colors.black,
                fontFamily: FontFamilyHelper.montserrat
              ),
            ),
            const HorizontalSpace(width: 10),
            InkWell(
              onTap: (){
                downvote=!downvote;
                if(downvote){
                  if(upvote){
                    cubit.posts!.data![widget.index].votes=cubit.posts!.data![widget.index].votes!-1;
                  }
                  upvote=false;
                  cubit.downVotePost(index: widget.index);
                  cubit.posts!.data![widget.index].votes=cubit.posts!.data![widget.index].votes!-1;
                }else{
                  cubit.resetVotePost(index: widget.index);
                  cubit.posts!.data![widget.index].votes=cubit.posts!.data![widget.index].votes!+1;
                }
                setState(() {});
              },
              child: SvgPicture.asset(
                'assets/svgs/${downvote?'downvote_full':'downvote'}.svg',
                width: 15,
                color: (upvote||downvote)?Colors.white:Colors.black,
              )
            ),
          ],
        ),
      ),
    );
  }
}