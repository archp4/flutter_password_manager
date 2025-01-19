import 'package:features_tour/features_tour.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwd_mng/helpers/list_helper.dart';
import 'package:pwd_mng/helpers/password_helper.dart';
import 'package:pwd_mng/helpers/settings.dart';
import 'package:pwd_mng/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FeaturesTour.setGlobalConfig(
    force: null,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PasswordHelper()),
        ChangeNotifierProvider(create: (_) => ListHelper()),
        ChangeNotifierProvider(create: (_) => AppSettings()),
      ],
      child: const MyApp(),
    ),
  );
}
