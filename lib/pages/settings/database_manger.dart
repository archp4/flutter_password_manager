import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';

Future<bool> backupIt() async {
  var status = await Permission.manageExternalStorage.status;
  if (!status.isGranted) {
    await Permission.manageExternalStorage.request();
  }

  var status1 = await Permission.storage.status;
  if (!status1.isGranted) {
    await Permission.storage.request();
  }

  try {
    final dbFolder = await getDatabasesPath();
    final dbPath = join(dbFolder, 'lock_it.db');
    final downloadFolder = await FilePicker.platform.getDirectoryPath();

    File dbFile = File(dbPath);

    await dbFile.copy(join(downloadFolder!, 'lock_it.db'));
    debugPrint(join(downloadFolder, 'lock_it.db'));
    return true;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> restoreIt() async {
  final dbFolder = await getDatabasesPath();
  final dbPath = join(dbFolder, 'lock_it.db');
  var status = await Permission.manageExternalStorage.status;
  if (!status.isGranted) {
    await Permission.manageExternalStorage.request();
  }

  var status1 = await Permission.storage.status;
  if (!status1.isGranted) {
    await Permission.storage.request();
  }
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    File source = File(result.files.single.path!);
    await source.copy(dbPath);
    return true;
  } else {
    return false;
  }
}
