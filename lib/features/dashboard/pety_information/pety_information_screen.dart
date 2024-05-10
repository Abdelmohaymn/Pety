
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/dashboard/pety_information/widgets/pety_info_bloc_listener.dart';
import 'package:pety/features/dashboard/shared/cubit/dashobard_cubit.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/widgets/default_button.dart';
import 'package:pety/shared/widgets/default_text_field.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class PetyInfoScreen extends StatelessWidget{
  const PetyInfoScreen({super.key});

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    DashboardCubit cubit = context.read<DashboardCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    DefaultTextField(
                        context: context,
                        controller: cubit.nameController,
                        keyboardType: TextInputType.text,
                        label: 'Name',
                        validate: (value){
                          if(value==null||!value.isNotBlank()){
                            return 'Name must not be empty';
                          }
                          return null;
                        }
                    ),
                    const VerticalSpace(height: 20),
                    DefaultTextField(
                        context: context,
                        controller: cubit.serviceController,
                        keyboardType: TextInputType.text,
                        label: 'Service Name',
                        validate: (value){
                          if(value==null||!value.isNotBlank()){
                            return 'Service name must not be empty';
                          }
                          return null;
                        }
                    ),
                    const VerticalSpace(height: 20),
                    DefaultTextField(
                        context: context,
                        controller: cubit.phoneController,
                        keyboardType: TextInputType.text,
                        label: 'Phone',
                        validate: (value){
                          if(value==null||!value.isNotBlank()){
                            return 'Phone must not be empty';
                          }
                          return null;
                        }
                    ),
                    const VerticalSpace(height: 20),
                    DefaultTextField(
                        context: context,
                        controller: cubit.emailController,
                        keyboardType: TextInputType.text,
                        label: 'Email',
                        validate: (value){
                          if(value==null||!value.isNotBlank()){
                            return 'Email must not be empty';
                          }
                          return null;
                        }
                    ),
                    const VerticalSpace(height: 20),
                    DefaultTextField(
                        context: context,
                        controller: cubit.priceController,
                        keyboardType: TextInputType.text,
                        label: 'Price',
                        validate: (value){
                          if(value==null||!value.isNotBlank()){
                            return 'Price must not be empty';
                          }
                          return null;
                        }
                    ),
                    const VerticalSpace(height: 20),
                    DefaultTextField(
                        context: context,
                        controller: cubit.locationController,
                        keyboardType: TextInputType.text,
                        label: 'Location',
                        validate: (value){
                          if(value==null||!value.isNotBlank()){
                            return 'Location must not be empty';
                          }
                          return null;
                        }
                    ),
                    const VerticalSpace(height: 20),
                    DefaultTextField(
                        context: context,
                        controller: cubit.descriptionController,
                        keyboardType: TextInputType.text,
                        label: 'Description',
                        validate: (value){
                          return null;
                        }
                    ),
                  ],
                ),
              ),
            ),
            const VerticalSpace(height: 40),
            DefaultButton(
                text: 'Save changes',
                color: ColorManager.orange,
                width: double.infinity,
                onClick: (){
                  if(formKey.currentState!.validate()){
                    cubit.updatePetyInfo();
                  }
                }
            ),
            //const PetyInfoBlocListener(),
          ],
        )
      ),
    );
  }

}