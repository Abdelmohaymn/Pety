import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/profile/cubit/profile_cubit.dart';
import 'package:pety/features/profile/cubit/profile_states.dart';

class ProfileImageAvatar extends StatelessWidget {
  const ProfileImageAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = ProfileCubit.get(context);
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        if(cubit.profImage!=null){
          return CircleAvatar(
            radius: 50,
            backgroundImage: FileImage(cubit.profImage!),
          );
        }else if(cubit.profileImage != null) {
          return CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(cubit.profileImage!),
          );
        }else{
          return const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/default_vet_image.jpg'),
          );
        }
      },
    );
  }
}