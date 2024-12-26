import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';

Future<bool> backupIt() async {
  final dbFolder = await getDatabasesPath();

  File dbSource = File('$dbFolder/lock_it.db');
  Directory copyTo =
      await getDownloadsDirectory() ?? Directory("storage/emulated/0/LockIt");

  // print("Path exist");
  if ((await copyTo.exists())) {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  } else {
    debugPrint("not exist");
    if (await Permission.storage.request().isGranted) {
      await copyTo.create();
    } else {
      debugPrint('Please give permission');
    }
  }

  String newPath = "${copyTo.path}/lock_it.db";
  await dbSource.copy(newPath).then((_) {
    return true;
  }).onError((error, _) {
    return false;
  });

  return false;
}

Future<bool> restoreIt() async {
  final dbFolder = await getDatabasesPath();
  final dbPath = join(dbFolder, 'lock_it.db');

  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    File source = File(result.files.single.path!);
    await source.copy(dbPath).then((_) {
      return true;
    }).onError((e, _) {
      return false;
    });
  } else {
    return false;
  }

  return false;
}
