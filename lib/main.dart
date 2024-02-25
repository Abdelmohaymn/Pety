
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/bloc_obsrver.dart';
import 'package:pety/pety_app.dart';
import 'package:pety/shared/di/dependency_injection.dart';
import 'package:pety/shared/network/local/shared_pred_constants.dart';
import 'package:pety/shared/network/local/shared_pref_helper.dart';
import 'package:pety/shared/routing/app_router.dart';
import 'package:pety/shared/routing/routes.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await setupGetIt();
  await SharedPrefHelper.init();

  String initialRoute = Routes.petLayout;
  String? token = SharedPrefHelper.getData(key: SharedPrefConstants.tokenKey);
  if(token!=null){
     initialRoute = Routes.petLayout;
  }

  runApp(PetyApp(
    appRouter: AppRouter(),
    initialRoute: initialRoute,
  ));
}




