
import 'package:flutter/material.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_back_app_bar.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{

  final String? title;
  final List<Widget>? actions;
  final Function? onBack;
  const DefaultAppBar({
    super.key,
    this.title,
    this.actions,
    this.onBack
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.backgroundBlue,
      leading: DefaultBackAppBar(
        context: context,
        onBack: onBack,
      ),
      title: title!=null?Text(
        title!,
        style: TextStyles.font18LightBlackBold.copyWith(
          fontFamily: "Montserrat"
        ),
      ):null,
      centerTitle: true,
      actions: actions
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  const Size.fromHeight(kToolbarHeight);

}