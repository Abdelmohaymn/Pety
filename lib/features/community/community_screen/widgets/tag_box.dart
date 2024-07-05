
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';

class TagBox extends StatelessWidget{
  const TagBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 0.5,color: ColorManager.hintOFSearchTextField)
      ),
      child: Text(
        'Funny/Cute',
        style: GoogleFonts.montserrat(
          textStyle: TextStyles.font8BlackSemiBold
        ),
      ),
    );
  }

}