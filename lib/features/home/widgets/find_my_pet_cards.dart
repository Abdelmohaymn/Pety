
import 'package:flutter/material.dart';
import 'package:pety/features/home/widgets/find_pet_card.dart';
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
          child: FindPetCard(
            title: 'Found a lost pet?',
            buttonText: 'Share details',
            image: 'cat_find2.png',
            onClick: (){
              context.pushNamed(Routes.uploadMissingPet,arguments: context);
            },
          ),
        ),
        const HorizontalSpace(width: 10),
        Expanded(
          child: FindPetCard(
            title: 'Lost a pet?',
            buttonText: 'Find your pet',
            image: 'dog_find2.png',
            onClick: (){
              context.pushNamed(Routes.searchForMissingPet,arguments: context);
            },
          ),
        ),
      ],
    );
  }

}