
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/community/add_post_screen/widgets/add_post_listener.dart';
import 'package:pety/features/community/add_post_screen/widgets/svg_button_text.dart';
import 'package:pety/features/community/shared/cubit/community_cubit.dart';
import 'package:pety/features/community/shared/cubit/community_states.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_app_bar.dart';
import 'package:pety/shared/widgets/default_button.dart';

class AddPostScreen extends StatelessWidget{
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CommunityCubit cubit = context.read<CommunityCubit>();
    return PopScope(
      canPop: false,
      onPopInvoked: (v){
        if(v)return;
        cubit.onBackFromAddPost();
        context.pop();
      },
      child: Scaffold(
        backgroundColor: ColorManager.backgroundBlue,
        resizeToAvoidBottomInset:false,
        appBar: DefaultAppBar(
          title: 'Create post',
          onBack: (){
            cubit.onBackFromAddPost();
            context.pop();
          },
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: DefaultButton(
                  height: 40.h,
                  width: 70.w,
                  radius: 8,
                  textStyle: TextStyles.font16WhiteBold,
                  color: ColorManager.orange,
                  text: 'Post',
                  onClick: (){
                    cubit.createPost();
                  }
              ),
            )
          ],
        ),
        body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              child: TextField(
                controller: cubit.postController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration.collapsed(
                  hintText: 'What\'s on your mind?',
                  hintStyle: TextStyles.font14GreyLight.copyWith(
                    fontSize: 20.sp,
                    fontFamily: "Montserrat"
                  ),
                ),
                onTapOutside: (value){
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
            ),
          ),
          BlocBuilder<CommunityCubit,CommunityStates>(
            builder: (context,state){
              if(cubit.postImageFile!=null){
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 250.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: FileImage(cubit.postImageFile!)
                            )
                        ),

                      ),
                      IconButton(
                          onPressed: () {
                            cubit.deletePostImage();
                          },
                          icon: const Icon(
                            Icons.delete_forever, color: Colors.redAccent,)
                      )
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: SvgButtonText(img: 'add_img', title: 'Add Image', onTab: () {cubit.pickImage();},)),
              Expanded(child: SvgButtonText(img: 'add_tag', title: 'Add Tag', onTab: () {},)),
            ],
          ),
          const AddPostListener(),
        ],
                ),
      ),
    );
  }

}