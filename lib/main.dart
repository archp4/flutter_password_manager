import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwd_mng/helpers/list_helper.dart';
import 'package:pwd_mng/helpers/password_helper.dart';
import 'package:pwd_mng/helpers/preference_helper.dart';
import 'package:pwd_mng/helpers/settings.dart';
import 'package:pwd_mng/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isDark = await PreferenceHelper.getDarkMode();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PasswordHelper()),
        ChangeNotifierProvider(create: (_) => ListHelper()),
        ChangeNotifierProvider(create: (_) => AppSettings()),
      ],
      child: MyApp(isDark: isDark),
    ),
  );
}
