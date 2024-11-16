import 'package:flutter/material.dart';
import 'package:pwd_mng/models/const.dart';
import 'package:pwd_mng/models/password_data.dart';
import 'package:pwd_mng/widgets/edit_password_form.dart';

void editPasswordSheet(context, PasswordData password) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(defaultSpace),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: EditPasswordForm(password: password),
        ),
      );
    },
  );
}
