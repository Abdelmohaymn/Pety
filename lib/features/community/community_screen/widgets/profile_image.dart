

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/community/shared/cubit/community_cubit.dart';
import 'package:pety/features/community/shared/cubit/community_states.dart';

class ProfileImage extends StatelessWidget {
  final double? radius;
  final String? img;
  const ProfileImage({
    super.key,
    this.radius,
    this.img
  });

  @override
  Widget build(BuildContext context) {
    CommunityCubit cubit = context.read<CommunityCubit>();

    return BlocBuilder<CommunityCubit, CommunityStates>(
      builder: (context, state) {
        if(img != null) {
          return CircleAvatar(
            radius: radius??20,
            backgroundImage: NetworkImage(img!),
          );
        }else{
          return CircleAvatar(
            radius: radius??20,
            backgroundImage: const AssetImage('assets/images/default_vet_image.jpg'),
          );
        }
      },
    );
  }
}