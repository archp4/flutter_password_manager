import 'package:flutter/material.dart';
import 'package:pwd_mng/models/const.dart';
import 'package:pwd_mng/models/password_data.dart';
import 'package:pwd_mng/widgets/custom_dropdown_new_password.dart';
import 'package:pwd_mng/widgets/custom_textfield_new_password.dart';

class NewPasswordForm extends StatefulWidget {
  const NewPasswordForm({
    super.key,
  });

  @override
  State<NewPasswordForm> createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends State<NewPasswordForm> {
  String? selectedValue = passwordTypeList[0];
  final userIdController = TextEditingController();
  final passwordController = TextEditingController();
  final websiteController = TextEditingController();
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(height: defaultSpace),
          CTFNewPassword(
            controller: userIdController,
            label: "ID / Username",
            iconData: Icons.person,
          ),
          const SizedBox(height: defaultSpace),
          CTFNewPassword(
            controller: passwordController,
            label: "Password",
            iconData: Icons.key,
          ),
          const SizedBox(height: defaultSpace),
          CTFNewPassword(
            controller: websiteController,
            label: "Website",
            iconData: Icons.web,
          ),
          const SizedBox(height: defaultSpace),
          CTFNewPassword(
            controller: noteController,
            label: "Note",
            iconData: Icons.note,
          ),
          const SizedBox(height: defaultSpace),
          Row(
            children: [
              const SizedBox(width: 1),
              const Text("Password Category : "),
              Expanded(
                child: CDDNewPassword(
                  selectedValue: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: defaultSpace),
          ElevatedButton(
            onPressed: () {
              final text =
                  " ${userIdController.text} / ${passwordController.text} / ${websiteController.text} / ${noteController.text}";
              final data = PasswordData(
                title: "asas",
                userId: "As",
                password: "as",
                isFavorite: false,
                lastUpdate: DateTime.now().toString(),
                type:
                    passwordTypeList.indexWhere((cat) => cat == selectedValue),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    data.toString() + text,
                  ),
                ),
              );
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
