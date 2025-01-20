// ignore_for_file: use_build_context_synchronously

import 'package:features_tour/features_tour.dart';
import 'package:flutter/material.dart';
import 'package:pwd_mng/helpers/local_auth.dart';
import 'package:pwd_mng/helpers/password_helper.dart';
import 'package:pwd_mng/helpers/settings.dart';
import 'package:pwd_mng/pages/settings/database_manger.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var isDark = true;
  var isAuth = true;

  final tourController = FeaturesTourController("Settings");

  @override
  Widget build(BuildContext context) {
    isAuth = context.watch<AppSettings>().isAuth;
    isDark = context.watch<AppSettings>().isDark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          FeaturesTour(
            controller: tourController,
            index: 0,
            introduce: const Text("Change Theme Between Light and Dark Mode"),
            child: ListTile(
              leading: const Icon(Icons.brightness_4),
              title: const Text("Dark Mode"),
              trailing: Switch(
                value: isDark,
                onChanged: (val) {
                  context.read<AppSettings>().updateDarkMode(val);
                },
              ),
            ),
          ),
          FeaturesTour(
            controller: tourController,
            index: 1,
            introduce: const Text("Turn On or Off Local Authenication"),
            child: ListTile(
              leading: const Icon(Icons.lock),
              title: const Text("Security"),
              trailing: Switch(
                value: isAuth,
                onChanged: (val) async {
                  if (val == true) {
                    if (await LocalAuth.canAuthenticale()) {
                      context.read<AppSettings>().updateAuthMode(val);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "Must Setup Lock Screen / Biometers Auth To Access this Feature "),
                        ),
                      );
                    }
                  } else {
                    context.read<AppSettings>().updateAuthMode(val);
                  }
                },
              ),
            ),
          ),
          FeaturesTour(
            controller: tourController,
            index: 2,
            introduce: const Text("Created A Backup for Your Password"),
            child: ListTile(
              leading: const Icon(Icons.storage),
              title: const Text("Backup"),
              onTap: () async {
                bool temp = await backupIt();
                var message = "";
                if (temp) {
                  message = "Backup Complete";
                } else {
                  message = "Backup Failed";
                }

                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              },
            ),
          ),
          FeaturesTour(
            controller: tourController,
            index: 3,
            introduce: const Text("Restore Data using Backup File"),
            child: ListTile(
              leading: const Icon(Icons.restore),
              title: const Text("Restore Password"),
              onTap: () async {
                bool temp = await restoreIt();
                var message = "";
                if (temp) {
                  message = "Data Restore Complete";
                } else {
                  message = "Data Restore Failed";
                }
                context.read<PasswordHelper>().getPasswords();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              },
            ),
          ),
        ],
      ),
    );
  }
}
