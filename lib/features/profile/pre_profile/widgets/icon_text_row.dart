
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/shared/styles/font_families.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';

class IconTextRow extends StatelessWidget{
  final IconData icon;
  final String title;
  final Function()? onTab;
  IconTextRow({
    super.key,
    required this.icon,
    required this.title,
    this.onTab
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Row(
        children: [
          Icon(icon,size: 15.w,),
          const HorizontalSpace(width: 10),
          Text(
            title,
            style: TextStyles.font12BlackMedium.copyWith(
              fontFamily: FontFamilyHelper.montserrat
            ),
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios_outlined,size: 20.w,),
        ],
      ),
    );
  }

}