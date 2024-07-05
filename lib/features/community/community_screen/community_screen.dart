
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pety/features/community/community_screen/widgets/post_edit_text.dart';
import 'package:pety/features/community/community_screen/widgets/post_item.dart';
import 'package:pety/features/community/community_screen/widgets/profile_image.dart';
import 'package:pety/features/community/shared/cubit/community_cubit.dart';
import 'package:pety/features/community/shared/cubit/community_states.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/routing/routes.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/widgets/default_app_bar.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CommunityCubit cubit = context.read<CommunityCubit>();
    return Scaffold(
      backgroundColor: ColorManager.backgroundBlue,
      appBar: const DefaultAppBar(
        title: 'Community',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                context.pushNamed(Routes.communityAddPost,arguments: context);
              },
              child: Row(
                children: [
                  const ProfileImage(),
                  const HorizontalSpace(width: 8),
                  const Expanded(child: PostEditText()),
                  const HorizontalSpace(width: 8),
                  SvgPicture.asset('assets/svgs/add_img.svg'),
                ],
              ),
            ),
            const VerticalSpace(height: 10),
            BlocBuilder<CommunityCubit, CommunityStates>(
              builder: (context, state) {
                if(state is ErrorGetPosts){
                  return Center(
                      child: Text(state.error)
                  );
                }
                else if(cubit.posts!=null) {
                  if(cubit.posts!.results==0){
                    return const Center(
                        child: Text('There are no posts yet.')
                    );
                  }
                  return Expanded(
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index)=> PostItem(index: index,),
                        separatorBuilder: (context,index)=>const VerticalSpace(height: 10),
                        itemCount: cubit.posts!.results!
                    ),
                  );
                }else{
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

}