
import 'package:flutter/material.dart';
import 'package:pety/shared/extensions.dart';

class DefaultBackAppBar extends StatelessWidget{

  final BuildContext context;
  final Function? onBack;
  const DefaultBackAppBar({
    super.key,
    required this.context,
    this.onBack
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onBack!=null){
          onBack!();
        }else{
          context.pop();
        }
      },
      borderRadius: BorderRadius.circular(25),
      child: const Icon(Icons.arrow_back_ios_new_outlined,size: 20,)
    );
  }
}