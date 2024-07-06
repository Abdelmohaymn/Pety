
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/pety_app.dart';
import 'package:pety/shared/di/dependency_injection.dart';
import 'package:pety/shared/network/local/shared_pred_constants.dart';
import 'package:pety/shared/network/local/shared_pref_helper.dart';
import 'package:pety/shared/network/remote/dio_helper.dart';
import 'package:pety/shared/routing/app_router.dart';
import 'package:pety/shared/routing/routes.dart';
import 'bloc_obsrver.dart';




class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  /*ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  (DioHelper.getDio().httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (client) {
    SecurityContext sc = SecurityContext();
    sc.setTrustedCertificatesBytes(data.buffer.asUint8List());
    HttpClient httpClient = HttpClient(context: sc);
    return httpClient;
  };*/

  Bloc.observer = MyBlocObserver();
  await setupGetIt();
  await SharedPrefHelper.init();

  runApp(
      PetyApp(
        appRouter: AppRouter(),
        initialRoute: Routes.openingScreen,
    )
  );
}




