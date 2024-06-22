
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/routing/routes.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_button.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';

class KnowAboutCommunity extends StatelessWidget{
  const KnowAboutCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        surfaceTintColor: Colors.white,
        elevation: 0,
        color: Colors.white,
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal:8.w,vertical: 8.h),
          child: Row(
            children: [
              //SvgPicture.asset('assets/svgs/menu.svg'),
              const Icon(Icons.chat_bubble_outline,size: 35,color: ColorManager.defaultColor,),
              const HorizontalSpace(width: 5),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Have a question\nabout pet caring?',
                      style: TextStyles.font16BlackBold.copyWith(height: 1.2),
                    ),
                    Text(
                      'ask our community of pet owners\nor check the FAQ',
                      style: TextStyles.font8BlackLight,
                    ),
                  ],
                ),
              ),
              const HorizontalSpace(width: 5),
              DefaultButton(
                height: 50.h,
                text: 'community',
                color: ColorManager.orange,
                textStyle: TextStyles.font14WhiteRegular,
                onClick: (){
                  //context.pushNamed(Routes.missingPetsScreen,arguments: context);
                  context.read<PetLayoutCubit>().moveToChatBotScreen(context);
                }
              )
            ],
          ),
        )
    );
  }

}