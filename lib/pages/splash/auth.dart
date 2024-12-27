import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pwd_mng/helpers/local_auth.dart';
import 'package:pwd_mng/helpers/preference_helper.dart';
import 'package:pwd_mng/main_page.dart';

class AuthHome extends StatefulWidget {
  const AuthHome({super.key});
  @override
  State<AuthHome> createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  var authStatus = false;

  authNow() async {
    var isAuth = await PreferenceHelper.getLocalAuth();
    if (isAuth) {
      debugPrint("true: ${isAuth}");
      bool temp = await LocalAuth.authenticate();
      if (temp) {
        setState(() => authStatus = true);
      } else {
        SystemNavigator.pop();
      }
    } else {
      debugPrint("else: ${isAuth}");
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
