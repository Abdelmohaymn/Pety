import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/profile/cubit/profile_cubit.dart';
import 'package:pety/features/profile/pre_profile/widgets/icon_text_row.dart';
import 'package:pety/features/profile/widgets/image_avatar.dart';
import 'package:pety/shared/constants/pety_constants.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/routing/routes.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_button.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class PreProfileScreen extends StatelessWidget {
  const PreProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = context.read<ProfileCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        child: Column(
          children: [
            const ProfileImageAvatar(),
            const VerticalSpace(height: 15),
            Text(
              '${cubit.firstNameController.text} ${cubit.lastNameController.text}',
              style: TextStyles.font13BlackBold,),
            const VerticalSpace(height: 15),
            DefaultButton(
              width: 110.w,
              textStyle: TextStyles.font14WhiteRegular,
              text: 'Edit profile',
              onClick: (){
                context.pushNamed(Routes.editProfileScreen,arguments: context);
              }
            ),
            const VerticalSpace(height: 30),
            IconTextRow(icon: Icons.settings_outlined, title: 'Settings',),
            const VerticalSpace(height: 15),
            IconTextRow(
              icon: Icons.space_dashboard_outlined,
              title: 'Dashboard',
              onTab: (){
                context.pushNamed(Routes.dashboardRoles);
              },
            ),
            const VerticalSpace(height: 15),
            IconTextRow(icon: Icons.view_timeline_outlined, title: 'My appointments',),
            const VerticalSpace(height: 15),
            IconTextRow(icon: Icons.help_outline, title: 'Help & support',),
            const VerticalSpace(height: 15),
            IconTextRow(
              icon: Icons.work_outline,
              title: 'Apply for pety',
              onTab: (){
                cubit.moveToWebPage(PetyWebsiteUrls.becomeAPety);
              },
            ),
            const VerticalSpace(height: 15),
            IconTextRow(
              icon: Icons.logout_outlined,
              title: 'Logout',
              onTab: (){
                cubit.logOut(context);
              },
            ),
            const VerticalSpace(height: 15),
          ],
        ),
      ),
    );
  }

}