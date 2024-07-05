
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/community/add_post_screen/add_post_screen.dart';
import 'package:pety/features/community/community_screen/community_screen.dart';
import 'package:pety/features/community/shared/cubit/community_cubit.dart';
import 'package:pety/features/dashboard/dashboard_layout/dashboard_layout.dart';
import 'package:pety/features/dashboard/history_screen/history_screen.dart';
import 'package:pety/features/dashboard/roles/roles_screen.dart';
import 'package:pety/features/dashboard/shared/cubit/dashobard_cubit.dart';
import 'package:pety/features/login/cubit/login_cubit.dart';
import 'package:pety/features/login/login_screen.dart';
import 'package:pety/features/pety_layout/chat_bot_screen/chat_bot_screen.dart';
import 'package:pety/features/pety_layout/find_my_pet/result_of_search/missing_pets_screen.dart';
import 'package:pety/features/pety_layout/find_my_pet/search_for_pet/search_for_missing_pet.dart';
import 'package:pety/features/pety_layout/find_my_pet/upload_pet/upload_missing_pet.dart';
import 'package:pety/features/profile/cubit/profile_cubit.dart';
import 'package:pety/features/profile/profile_screen.dart';
import 'package:pety/features/profile/user_visits_screen/user_visits_screen.dart';
import 'package:pety/features/register/cubit/register_cubit.dart';
import 'package:pety/features/register/register_screen.dart';
import 'package:pety/features/search_vet/book_vet_screen/book_vet.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/features/search_vet/search_for_vet_screen/search_for_vet.dart';
import 'package:pety/features/search_vet/vet_details_screen/vet_details_screen.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/features/pety_layout/pety_layout.dart';
import 'package:pety/shared/di/dependency_injection.dart';
import 'package:pety/shared/routing/routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen :
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen(),
              ),
        );
      case Routes.registerScreen :
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<RegisterCubit>(),
                child: const RegisterScreen(),
              ),
        );
      case Routes.petLayout :
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<PetLayoutCubit>()..getLocationsData(),
                child: const PetLayout(),
              ),
        );
      case Routes.searchForVet :
        String role = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) =>
                getIt<SearchVetCubit>()
                ..getVets(role: role),
                //..getUserData(),
                child: const SearchForVet(),
              ),
        );
      case Routes.vetDetails :
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(
                value: BlocProvider.of<SearchVetCubit>(settings.arguments as BuildContext)..getPetyDetails(),
                child: const VetDetailsScreen(),
              ),
        );
      case Routes.bookVet :
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(
                value: BlocProvider.of<SearchVetCubit>(settings.arguments as BuildContext),
              child: const BookVetScreen()
          ),
        );
      case Routes.editProfileScreen :
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(
                  value: BlocProvider.of<ProfileCubit>(settings.arguments as BuildContext),
                  child: const ProfileScreen()
              ),
        );
      case Routes.userVisitsScreen :
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(
                  value: BlocProvider.of<ProfileCubit>(settings.arguments as BuildContext)..getUserVisits(),
                  child: const UserVisitsScreen()
              ),
        );
      case Routes.dashboardRoles :
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) =>
                getIt<DashboardCubit>()
                  ..getPetyRoles(),
                child: const RolesScreen(),
              ),
        );
      case Routes.dashboardLayout :
        Map<String,dynamic> mp = settings.arguments as Map<String,dynamic>;
        BuildContext cubitContext = mp['cubitContext'];
        String role = mp['petRole'];
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(
                  value: BlocProvider.of<DashboardCubit>(cubitContext)
                    ..getAllAppointments(role)
                    ..getWorkHours(role)
                    ..getPetyInfo(role),
                  child: DashboardLayout(role: role,)
              ),
        );
      case Routes.dashboardHistoryAppointment:
        Map<String,dynamic> mp = settings.arguments as Map<String,dynamic>;
        BuildContext cubitContext = mp['cubitContext'];
        String id = mp['id'];
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(
                  value: BlocProvider.of<DashboardCubit>(cubitContext)..getUserHistory(id),
                  child: const HistoryScreen()
              ),
        );
      case Routes.chatBotScreen :
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(
                  value: BlocProvider.of<PetLayoutCubit>(settings.arguments as BuildContext),
                  child: const ChatBotScreen()
              ),
        );
      case Routes.searchForMissingPet :
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(
                  value: BlocProvider.of<PetLayoutCubit>(settings.arguments as BuildContext),
                  child: const SearchForMissingPetScreen()
              ),
        );
      case Routes.uploadMissingPet :
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(
                  value: BlocProvider.of<PetLayoutCubit>(settings.arguments as BuildContext),
                  child: const UploadMissingPetScreen()
              ),
        );
      case Routes.missingPetsScreen :
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(
                  value: BlocProvider.of<PetLayoutCubit>(settings.arguments as BuildContext),
                  child: const MissingPetsScreen()
              ),
        );
      case Routes.communityScreen :
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<CommunityCubit>()..getPosts()..getUserData(),
                child: const CommunityScreen(),
              ),
      );
      case Routes.communityAddPost :
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(
                  value: BlocProvider.of<CommunityCubit>(settings.arguments as BuildContext),
                  child: const AddPostScreen()
              ),
        );
      default :
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(
                body: Center(
                  child: Text(
                      'No route defined for ${settings.name}'
                  ),
                ),
              ),
        );
    }
  }
}