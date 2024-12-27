import 'package:flutter/material.dart';
import 'package:pwd_mng/helpers/settings.dart';
import 'package:pwd_mng/models/theme.dart';
import 'package:provider/provider.dart';
import 'package:pwd_mng/pages/splash/auth.dart';
import 'package:pwd_mng/pages/splash/splash.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LockIt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: context.watch<AppSettings>().isDark
            ? customTheme()
            : customLightTheme(),
        useMaterial3: true,
      ),
      home: const AuthHome(),
    );
  }
}
