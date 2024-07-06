
import 'package:flutter/cupertino.dart';
import 'package:pety/shared/styles/font_families.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class InfoItem extends StatelessWidget{
  final String title,content;
  const InfoItem({super.key,required this.title,required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyles.font8BlackBold.copyWith(
                fontFamily: FontFamilyHelper.montserrat
              ),
            ),
            const HorizontalSpace(width: 5),
            Expanded(
              child: Text(
                content,
                  style: TextStyles.font8BlackMedium.copyWith(
                      fontFamily: FontFamilyHelper.montserrat
                  )
              ),
            ),
          ],
        ),
        const VerticalSpace(height: 10),
      ],
    );
  }

}