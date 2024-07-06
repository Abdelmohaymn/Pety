
import 'package:flutter/material.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/font_families.dart';
import 'package:pety/shared/styles/texts.dart';

class DefaultTextField extends StatelessWidget{

  final BuildContext context;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String label;
  final String? Function(String?)? validate;
  final void Function(String)? onSubmit;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final void Function()? suffixPressed;
  final void Function(bool)? focus;
  final IconData? prefix;
  final IconData? suffix;
  final Color? suffixColor;
  final bool? isObscure;

  const DefaultTextField({
    super.key,
    required this.context,
    required this.controller,
    required this.keyboardType,
    required this.label,
    this.validate,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.suffixPressed,
    this.focus,
    this.prefix,
    this.suffix,
    this.suffixColor,
    this.isObscure,
  });


  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (isFocus){
        if(focus!=null){
          focus!(isFocus);
        }
      },
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isObscure??false,
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        onTap: onTap,
        validator: validate,
        decoration: InputDecoration(
          fillColor: ColorManager.textFieldFillColor,
          filled: true,
          labelText: label,
          labelStyle: TextStyles.font15GreyRegular.copyWith(
            fontFamily: FontFamilyHelper.montserrat
          ),
          prefixIcon: prefix!=null?Icon(
            prefix,
          ):null,
          suffixIcon: suffix != null?IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffix,
              //color: iconsColor,
            ),
          ):null,
          suffixIconColor: suffixColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: ColorManager.defaultColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

}
