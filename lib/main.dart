import 'package:flutter/material.dart';
import 'package:pwd_mng/main_page.dart';
import 'package:pwd_mng/models/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Vault',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: customTheme(),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
