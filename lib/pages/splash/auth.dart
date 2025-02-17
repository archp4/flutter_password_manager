// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pwd_mng/helpers/local_auth.dart';
import 'package:pwd_mng/helpers/preference_helper.dart';
import 'package:pwd_mng/main_page.dart';
import 'package:pwd_mng/pages/onboarding/onboarding.dart';

class AuthHome extends StatefulWidget {
  const AuthHome({super.key});
  @override
  State<AuthHome> createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  var authStatus = false;

  authNow() async {
    var isAuth = await PreferenceHelper.getLocalAuth();
    var isOnBoarded = await PreferenceHelper.getOnBoarding();

    if (!isOnBoarded) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const OnBoarding(),
        ),
      );
    }

    if (isAuth && isOnBoarded) {
      debugPrint("true: $isAuth");
      bool temp = await LocalAuth.authenticate();
      if (temp) {
        setState(() => authStatus = true);
      } else {
        SystemNavigator.pop();
      }
    } else {
      debugPrint("else: $isAuth");
      setState(() => authStatus = true);
    }
  }

  @override
  void initState() {
    super.initState();
    authNow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: authStatus
          ? const MainPage()
          : Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            ),
    );
  }
}
