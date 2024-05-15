
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';

class DefaultDropdownButton extends StatelessWidget{

  String? value;
  String hint;
  List<DropdownMenuItem<String>>items;
  Function(String?)? onChange;
  String? Function(String?)? validate;

  DefaultDropdownButton({
    super.key,
    required this.items,
    required this.hint,
    this.value,
    this.onChange,
    this.validate
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorManager.hintGrey,width: 0.5)
      ),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
          decoration: const InputDecoration(border: InputBorder.none),
          isExpanded: true,
          focusColor: Colors.white,
          value: value,
          items: items,
          onChanged: onChange,
          validator: validate,
          borderRadius: BorderRadius.circular(10),
          hint: Text(hint),
          style: GoogleFonts.montserrat(
            textStyle: TextStyles.font13HintGreyRegular
          ),
        ),
      ),
    );
  }

}