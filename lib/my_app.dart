import 'package:flutter/material.dart';
import 'package:pwd_mng/helpers/settings.dart';
import 'package:pwd_mng/main_page.dart';
import 'package:pwd_mng/models/theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({super.key, required this.isDark});

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
      home: const MainPage(),
    );
  }
}
