
import 'package:flutter/material.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/routing/routes.dart';
import 'package:pety/shared/widgets/default_button.dart';
import 'package:pety/shared/widgets/horizontal_space.dart';

class FindMyPetCards extends StatelessWidget{
  const FindMyPetCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DefaultButton(
            text: 'Search pet',
            onClick: () {
              context.pushNamed(Routes.searchForMissingPet,arguments: context);
            },
          ),
        ),
        const HorizontalSpace(width: 10),
        Expanded(
          child: DefaultButton(
            text: 'upload pet',
            onClick: () {
              context.pushNamed(Routes.uploadMissingPet,arguments: context);
            },
          ),
        ),
      ],
    );
  }

}