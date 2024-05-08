
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pety/features/dashboard/shared/cubit/dashobard_cubit.dart';
import 'package:pety/features/dashboard/shared/data/repository/dashboard_repository.dart';
import 'package:pety/features/login/cubit/login_cubit.dart';
import 'package:pety/features/login/data/repository/login_repo.dart';
import 'package:pety/features/pety_layout/cubit/pety_layout_cubit.dart';
import 'package:pety/features/pety_layout/data/repository/pety_repository.dart';
import 'package:pety/features/profile/cubit/profile_cubit.dart';
import 'package:pety/features/profile/data/repository/profile_repository.dart';
import 'package:pety/features/register/cubit/register_cubit.dart';
import 'package:pety/features/register/data/repository/register_repo.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/features/search_vet/data/repository/search_vet_repo.dart';
import 'package:pety/shared/network/remote/api_service.dart';
import 'package:pety/shared/network/remote/chatbot_api/chatbot_service.dart';
import 'package:pety/shared/network/remote/dio_helper.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async{

  //dio & api
  Dio dio = DioHelper.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<ChatBotService>(()=>ChatBotService(dio));

  // login
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // register
  getIt.registerLazySingleton<RegisterRepository>(() => RegisterRepository(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  //pet layout -- chat_bot
  getIt.registerLazySingleton<PetyRepository>(() => PetyRepository(getIt()));
  getIt.registerFactory<PetLayoutCubit>(() => PetLayoutCubit(getIt()));

  // search vet
  getIt.registerLazySingleton<SearchVetRepository>(() => SearchVetRepository(getIt()));
  getIt.registerFactory<SearchVetCubit>(() => SearchVetCubit(getIt()));

  // update profile
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepository(getIt(),ImagePicker()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));

  // dashboard
  getIt.registerLazySingleton<DashboardRepository>(() => DashboardRepository(getIt()));
  getIt.registerFactory<DashboardCubit>(() => DashboardCubit(getIt()));



}