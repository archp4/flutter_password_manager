import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwd_mng/helpers/password_helper.dart';
import 'package:pwd_mng/helpers/preference_helper.dart';
import 'package:pwd_mng/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isDark = await PreferenceHelper.getDarkMode();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PasswordHelper())],
      child: MyApp(isDark: isDark),
    ),
  );
}
