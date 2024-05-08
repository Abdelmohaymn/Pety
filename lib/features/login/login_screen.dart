
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/login/cubit/login_cubit.dart';
import 'package:pety/features/login/data/models/login_request_body.dart';
import 'package:pety/features/login/widgets/login_bloc_listener.dart';
import 'package:pety/shared/widgets/button_image.dart';
import 'package:pety/shared/widgets/default_button.dart';
import 'package:pety/shared/widgets/default_text_field.dart';
import 'package:pety/shared/widgets/password_text_field.dart';
import 'package:pety/shared/widgets/text_button.dart';
import 'package:pety/shared/widgets/text_title.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/routing/routes.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';

class LoginScreen extends StatelessWidget{

  const LoginScreen({super.key});

  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController = TextEditingController();
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                  textTitle(context: context, text: 'Sign in'),
                  SizedBox(height: 30.h,),
                  DefaultTextField(
                      context: context,
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      label: 'Email',
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
                  SizedBox(height: 60.h,),
                  DefaultButton(
                      horizontalPadding: 30.w,
                      text: 'Sign in',
                      color: ColorManager.defaultColor,
                      onClick: (){
                        if(formKey.currentState!.validate()){
                          context.read<LoginCubit>().emitLoginStates(
                              LoginRequestBody(email:emailController.text , password: passwordController.text)
                          );
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
                        child: Text('Or sign in with',style: TextStyles.font16BlackRegular,),
                      ),
                      const Expanded(
                          child:Divider(thickness: 1,color: ColorManager.dashLineColor,)
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonImage(
                          context: context,
                          imagePath: 'assets/svgs/facebook.svg',
                          onClick: (){}
                      ),
                      SizedBox(width: 50.w,),
                      ButtonImage(
                          context: context,
                          imagePath: 'assets/svgs/google.svg',
                          onClick: (){}
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?',style: TextStyles.font12BlackRegular,),
                      defaultTextButton(
                          text: 'Create one',
                          onClick: () {
                            context.pushNamed(Routes.registerScreen);
                          }
                      )
                    ],
                  ),
                  const LoginBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



}
