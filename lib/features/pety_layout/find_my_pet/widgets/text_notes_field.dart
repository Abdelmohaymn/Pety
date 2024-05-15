
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/font_weights.dart';
import 'package:pety/shared/styles/texts.dart';

class TextNotesField extends StatelessWidget{
  TextEditingController controller;
  String hint;
  TextNotesField({
    super.key,
    required this.controller,
    required this.hint
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 100
      ),
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorManager.hintGrey,width: 0.5),
          color: Colors.white
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: GoogleFonts.montserrat(
                    textStyle: TextStyles.font13HintGreyRegular
                ),
              ),
              style: GoogleFonts.montserrat(
                  textStyle: TextStyles.font13HintGreyRegular
              ),
            ),
          ),
        ],
      ),
    );
  }

}