import 'package:flutter/material.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/network/local/shared_pred_constants.dart';
import 'package:pety/shared/network/local/shared_pref_helper.dart';
import 'package:pety/shared/routing/routes.dart';

class OpeningScreen extends StatefulWidget {
  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  @override
  void initState() {
    super.initState();

    // Add a small delay to ensure the context is fully loaded
    Future.delayed(Duration(seconds: 1), () async {
      String initialRoute = Routes.loginScreen;
      String? token = await SharedPrefHelper.getData(key: SharedPrefConstants.tokenKey);
      if (token != null) {
        initialRoute = Routes.petLayout;
      }
      context.pushNamedAndRemoveUntil(initialRoute, predicate: (Route<dynamic> route) { return false; },);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Show a loading indicator while navigating
      ),
    );
  }
}
