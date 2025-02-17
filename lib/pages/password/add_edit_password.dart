// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pwd_mng/models/const.dart';
import 'package:pwd_mng/models/password_data.dart';
import 'package:pwd_mng/widgets/custom_alert_dialog.dart';
import 'package:pwd_mng/widgets/edit_password_form.dart';
import 'package:pwd_mng/widgets/new_password_form.dart';

class AddEditPassword extends StatefulWidget {
  final PasswordData? passwordData;
  const AddEditPassword({super.key, this.passwordData});

  @override
  State<AddEditPassword> createState() => _AddEditPasswordState();
}

class _AddEditPasswordState extends State<AddEditPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) {
              return;
            }
            final shouldPop =
                await CustomAlertDialog.showSimpleExitMessage(context: context);
            if (shouldPop) {
              Navigator.pop(context);
            }
          },
          child: IconButton(
            onPressed: () async {
              final shouldPop = await CustomAlertDialog.showSimpleExitMessage(
                  context: context);
              if (shouldPop) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blueAccent,
        title: Text(
          widget.passwordData == null ? "Add Password" : "Edit Password",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(defaultSpace),
        child: widget.passwordData == null
            ? const NewPasswordForm()
            : EditPasswordForm(password: widget.passwordData!),
      ),
    );
  }
}
