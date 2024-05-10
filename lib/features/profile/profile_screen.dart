import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/profile/cubit/profile_cubit.dart';
import 'package:pety/features/profile/cubit/profile_states.dart';
import 'package:pety/features/profile/widgets/image_avatar.dart';
import 'package:pety/features/profile/widgets/profile_bloc_listener.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_back_app_bar.dart';
import 'package:pety/shared/widgets/default_button.dart';
import 'package:pety/shared/widgets/default_text_field.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';
import 'package:pety/shared/widgets/password_text_field.dart';
import 'package:pety/shared/widgets/text_button.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = context.read<ProfileCubit>();
    return Scaffold(
      appBar: AppBar(
        leading: DefaultBackAppBar(context: context,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:16.w,vertical: 16.h),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ProfileImageAvatar(),
                const VerticalSpace(height: 15),
                defaultTextButton(text: 'change profile picture', onClick: () { cubit.pickImage(); }),
                const VerticalSpace(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: DefaultTextField(
                          context: context,
                          controller: cubit.firstNameController,
                          keyboardType: TextInputType.text,
                          label: 'First name',
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          }
                      ),
                    ),
                    const HorizontalSpace(width: 10),
                    Expanded(
                      child: DefaultTextField(
                          context: context,
                          controller: cubit.lastNameController,
                          keyboardType: TextInputType.text,
                          label: 'Last name',
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          }
                      ),
                    ),
                  ],
                ),
                const VerticalSpace(height: 20),
                DefaultTextField(
                    context: context,
                    controller: cubit.emailController,
                    keyboardType: TextInputType.emailAddress,
                    label: 'Email address',
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    }
                ),
                const VerticalSpace(height: 20),
                DefaultTextField(
                    context: context,
                    controller: cubit.phoneController,
                    keyboardType: TextInputType.phone,
                    label: 'Phone',
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    }
                ),
                const VerticalSpace(height: 20),
                PasswordTextField(
                  label: 'Password',
                  controller: cubit.passwordController,
                  validate: (value) {
                    return null;
                  },
                ),
                const VerticalSpace(height: 20),
                PasswordTextField(
                  label: 'Confirm password',
                  controller: cubit.confPasswordController,
                  validate: (value) {
                    return null;
                  },
                ),
                const VerticalSpace(height: 40),
                DefaultButton(
                  color: ColorManager.orange,
                  width: double.infinity,
                  text: 'Update',
                  onClick: () {
                    cubit.emitProfileStates();
                  },
                ),
                const ProfileBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

}