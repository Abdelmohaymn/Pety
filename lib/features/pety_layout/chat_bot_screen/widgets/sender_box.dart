
import 'package:flutter/material.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';

class SenderBox extends StatelessWidget{
  String message;
  SenderBox({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 3/4*MediaQuery.of(context).size.width
        ),
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: ColorManager.orange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)
          ),

        ),
        child: Text(
          message,
          style: TextStyles.font12BlackMedium.copyWith(color: Colors.white),
        ),
      ),
    );
  }
  
}