import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pwd_mng/helpers/preference_helper.dart';
import 'package:sqflite/sqflite.dart';

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
                  final dbFolder = await getDatabasesPath();
                  File source1 = File('$dbFolder/lock_it.db');

                  Directory copyTo =
                      Directory("storage/emulated/0/Sqlite Backup");
                  if ((await copyTo.exists())) {
                    // print("Path exist");
                    var status = await Permission.storage.status;
                    if (!status.isGranted) {
                      await Permission.storage.request();
                    }
                  } else {
                    debugPrint("not exist");
                    if (await Permission.storage.request().isGranted) {
                      // Either the permission was already granted before or the user just granted it.
                      await copyTo.create();
                    } else {
                      debugPrint('Please give permission');
                    }
                  }

                  String newPath = "${copyTo.path}/lock_it.db";
                  await source1.copy(newPath);

                  setState(() {});
                }),
            ListTile(
              leading: const Icon(Icons.restore),
              title: const Text("Restore Password"),
              onTap: () async {
                var databasesPath = await getDatabasesPath();
                var dbPath = join(databasesPath, 'lock_it.db');

                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();

                if (result != null) {
                  File source = File(result.files.single.path!);
                  await source.copy(dbPath);
                  setState(() {});
                } else {
                  // User canceled the picker
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
