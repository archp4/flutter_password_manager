import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwd_mng/helpers/password_helper.dart';
import 'package:pwd_mng/models/const.dart';
import 'package:pwd_mng/models/password_data.dart';
import 'package:pwd_mng/widgets/custom_dropdown_new_password.dart';
import 'package:pwd_mng/widgets/custom_textfield_new_password.dart';

class EditPasswordForm extends StatefulWidget {
  final PasswordData password;
  const EditPasswordForm({
    required this.password,
    super.key,
  });

  @override
  State<EditPasswordForm> createState() => _EditPasswordFormState();
}

class _EditPasswordFormState extends State<EditPasswordForm> {
  String? selectedValue = passwordTypeList[5];
  final userIdController = TextEditingController();
  final passwordController = TextEditingController();
  final websiteController = TextEditingController();
  final noteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    userIdController.text = widget.password.userId;
    passwordController.text = widget.password.password;
    websiteController.text = widget.password.title;
    noteController.text = widget.password.note ?? "";
    selectedValue = passwordTypeList[widget.password.type];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: defaultSpace),
            CTFNewPassword(
              controller: userIdController,
              label: "ID / Username",
              iconData: Icons.person,
              validationText: "Please Enter ID / Username",
            ),
            const SizedBox(height: defaultSpace),
            CTFNewPasswordOnly(
              isObsecre: isObscure,
              onChange: () => setState(() => isObscure = !isObscure),
              controller: passwordController,
              label: "Password",
              validationText: "Please Enter Password",
              iconData: Icons.key,
            ),
            const SizedBox(height: defaultSpace),
            CTFNewPassword(
              controller: websiteController,
              label: "Title",
              iconData: Icons.web,
              validationText: "Please Enter Title",
            ),
            const SizedBox(height: defaultSpace),
            CTFNewPassword(
              controller: noteController,
              label: "Note",
              iconData: Icons.note,
              validationText: "",
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final password = PasswordData(
                      id: widget.password.id,
                      title: websiteController.text,
                      userId: userIdController.text,
                      password: passwordController.text,
                      isFavorite: false,
                      lastUpdate: DateTime.now().toString(),
                      note: noteController.text.isEmpty
                          ? ""
                          : noteController.text,
                      type: passwordTypeList
                          .indexWhere((cat) => cat == selectedValue),
                    );
                    context.read<PasswordHelper>().updatePassword(password);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Data Added Update"),
                      ),
                    );
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }
                },
                child: const Text("Update"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
