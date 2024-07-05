
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';

class HeaderBottomSheet extends StatelessWidget{
  const HeaderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: (){
                  context.pop();
                },
                icon: const Icon(Icons.close,color: Colors.black,)
            ),
            Text(
              'Filters',
              style: GoogleFonts.inter(
                textStyle: TextStyles.font20BlackSemiBold
              ),
            )
          ],
        ),
        const Divider(color: ColorManager.dashLineColor,),
      ],
    );
  }

}