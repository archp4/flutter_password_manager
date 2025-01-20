import 'package:flutter/material.dart';
import 'package:pwd_mng/models/const.dart';
import 'package:pwd_mng/widgets/new_password_form.dart';

void addNewPasswordSheet(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(top: 20),
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
          child: const NewPasswordForm(),
        ),
      );
    },
  );
}
