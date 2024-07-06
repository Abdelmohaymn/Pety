
import 'package:flutter/material.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/styles/texts.dart';

class WidgetFunctions{

  static setupErrorState(BuildContext context, String error){
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font16BlackRegular,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font12DefaultRegular,
            ),
          ),
        ],
      ),
    );
  }

  static showSuccessSnackBar(BuildContext context,String msg){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:Center(
          child: Text(
            msg,
            style: TextStyles.font14WhiteRegular,
          ),
        ),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        duration: const Duration(milliseconds: 1000),
      )
    );
  }

  static showErrorSnackBar(BuildContext context,String msg){

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:Center(
            child: Text(
              msg,
              style: TextStyles.font14WhiteRegular,
            ),
          ),
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          duration: const Duration(milliseconds: 1000),
        )
    );
  }


}