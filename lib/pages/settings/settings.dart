import 'package:flutter/material.dart';
import 'package:pwd_mng/helpers/preference_helper.dart';
import 'package:pwd_mng/pages/settings/database_manger.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDark = true;
  bool isAuth = true;

  @override
  void initState() async {
    super.initState();
    isDark = await PreferenceHelper.getDarkMode();
    isAuth = await PreferenceHelper.getLocalAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.brightness_4),
              title: const Text("Dark Mode"),
              trailing: Switch(
                value: isDark,
                onChanged: (val) async {
                  await PreferenceHelper.setDarkMode(val).then(
                    (v) {
                      setState(() => isAuth = val);
                    },
                  );
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text("Security"),
              trailing: Switch(
                value: isDark,
                onChanged: (val) async {
                  await PreferenceHelper.setLocalAuth(val).then(
                    (_) {
                      setState(() => isAuth = val);
                    },
                  );
                },
              ),
            ),
            ListTile(
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
            ListTile(
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

                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
