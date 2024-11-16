import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwd_mng/helpers/display_list_helper.dart';
import 'package:pwd_mng/helpers/password_helper.dart';
import 'package:pwd_mng/main_page.dart';
import 'package:pwd_mng/models/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PasswordHelper()),
        ChangeNotifierProvider(create: (_) => ListHelper()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
