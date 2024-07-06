
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/register/cubit/register_cubit.dart';
import 'package:pety/features/register/data/models/register_request_body.dart';
import 'package:pety/features/register/widgets/register_bloc_listener.dart';
import 'package:pety/shared/widgets/button_image.dart';
import 'package:pety/shared/widgets/default_button.dart';
import 'package:pety/shared/widgets/default_text_field.dart';
import 'package:pety/shared/widgets/password_text_field.dart';
import 'package:pety/shared/widgets/text_title.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/routing/routes.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

import '../../shared/widgets/text_button.dart';

class RegisterScreen extends StatelessWidget{
  const RegisterScreen({super.key});

  static final TextEditingController firstNameController = TextEditingController();
  static final TextEditingController lastNameController = TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController = TextEditingController();
  static final TextEditingController confPasswordController = TextEditingController();
  static final TextEditingController phoneController = TextEditingController();
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
    ));

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:16.w,vertical: 16.h),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const VerticalSpace(height: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image(
                        height: 60.h,
                        width: 100.w,
                        image: const AssetImage(
                            'assets/images/logo.png'
                        )
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  textTitle(context: context, text: 'Sign up'),
                  SizedBox(height: 30.h,),
                  Row(
                    children: [
                      Expanded(
                        child:DefaultTextField(
                            context: context,
                            controller: firstNameController,
                            keyboardType: TextInputType.text,
                            label: 'First name',
                            validate: (value){
                              if(value==null||value.isEmpty){
                                return 'Please enter your first name';
                              }
                              return null;
                            }
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Expanded(
                        child:DefaultTextField(
                            context: context,
                            controller: lastNameController,
                            keyboardType: TextInputType.text,
                            label: 'Last name',
                            validate: (value){
                              if(value==null||value.isEmpty){
                                return 'Please enter your last name';
                              }
                              return null;
                            }
                        ),
                      ),
                    ],
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
                  DefaultTextField(
                      context: context,
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      label: 'Phone',
                      validate: (value){
                        if(value==null||value.isEmpty){
                          return 'Please enter your phone number';
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
                      horizontalPadding: 30.w,
                      text: 'Sign up',
                      color: ColorManager.defaultColor,
                      onClick: (){
                        if(formKey.currentState!.validate()){
                          context.read<RegisterCubit>().emitRegisterStates(
                              RegisterRequestBody(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                password: passwordController.text,
                                passwordConfirm: confPasswordController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                              )
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
                        child: Text(
                          'Or sign up with',
                          style: TextStyles.font16BlackRegular.copyWith(
                            fontFamily: "Montserrat"
                          )
                        ),
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
                            context.pushNamedAndRemoveUntil(Routes.loginScreen, predicate: (Route<dynamic> route) { return false; });
                          }
                      )
                    ],
                  ),
                  const RegisterBlocListener()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}