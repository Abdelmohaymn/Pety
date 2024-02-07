
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/register/cubit/register_cubit.dart';
import 'package:pety/features/register/cubit/register_states.dart';
import 'package:pety/shared/widgets/button_image.dart';
import 'package:pety/shared/widgets/default_button.dart';
import 'package:pety/shared/widgets/default_text_field.dart';
import 'package:pety/shared/widgets/password_text_field.dart';
import 'package:pety/shared/widgets/text_title.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/routing/routes.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';

import '../../shared/widgets/text_button.dart';

class RegisterScreen extends StatelessWidget{
  RegisterScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (BuildContext context, RegisterStates state) {  },
        builder: (BuildContext context, RegisterStates state) {

          RegisterCubit cubit = RegisterCubit.get(context);

          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:16.w,vertical: 16.h),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50.h,),
                        textTitle(context: context, text: 'Sign up'),
                        SizedBox(height: 30.h,),
                        DefaultTextField(
                            context: context,
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            label: 'Name',
                            validate: (value){
                              if(value==null||value.isEmpty){
                                return 'Please enter your name';
                              }
                              return null;
                            }
                        ),
                        SizedBox(height: 20.h,),
                        DefaultTextField(
                            context: context,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            label: 'Email address',
                            validate: (value){
                              if(value==null||value.isEmpty){
                                return 'Please enter your email';
                              }
                              return null;
                            }
                        ),
                        SizedBox(height: 20.h,),
                        PasswordTextField(
                          label: 'Password',
                          controller: passwordController,
                          validate: (value) {
                            if(value==null||value.isEmpty){
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h,),
                        PasswordTextField(
                          label: 'Confirm password',
                          controller: confPasswordController,
                          validate: (value) {
                            if(value==null||value.isEmpty){
                              return 'Please confirm your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40.h,),
                        DefaultButton(
                            context: context,
                            text: 'Sign up',
                            color: ColorManager.defaultColor,
                            onClick: (){
                              if(formKey.currentState!.validate()){

                              }
                            }
                        ),
                        SizedBox(height: 40.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(
                                child:Divider(thickness: 1,color: ColorManager.dashLineColor,)
                            ),
                             Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Text('Or sign up with',style: TextStyles.font16BlackRegular,),
                            ),
                            const Expanded(
                                child:Divider(thickness: 1,color: ColorManager.dashLineColor,)
                            ),
                          ],
                        ),
                        const SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonImage(
                                context: context,
                                imagePath: 'assets/svgs/facebook.svg',
                                color: ColorManager.defaultColor,
                                onClick: (){}
                            ),
                            SizedBox(width: 50.w,),
                            ButtonImage(
                                context: context,
                                imagePath: 'assets/svgs/google.svg',
                                color: ColorManager.defaultColor,
                                onClick: (){}
                            ),
                          ],
                        ),
                        const SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?',style: TextStyles.font12BlackRegular,),
                            defaultTextButton(
                                text: 'Login now',
                                onClick: () {
                                  context.pushNamed(Routes.loginScreen);
                                }
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}