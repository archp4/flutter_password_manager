import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:pwd_mng/models/const.dart';
import 'package:pwd_mng/models/password_data.dart';

class AddNewPasswordDialog extends StatefulWidget {
  const AddNewPasswordDialog({super.key});

  @override
  State<AddNewPasswordDialog> createState() => _AddNewPasswordDialogState();
}

class _AddNewPasswordDialogState extends State<AddNewPasswordDialog> {
  int tag = 4;
  List<String> options = passwordTypeList.sublist(1);
  int currentPage = 0;
  var titleController = TextEditingController();
  var userIdController = TextEditingController();
  var passwordController = TextEditingController();
  var repassword = TextEditingController();

  bool isFavorite = false;
  final _formKey = GlobalKey<FormState>();
  var pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(), //this right here
      child: Stack(
        children: [
          SizedBox(
            height: 410.0,
            width: 280,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              children: [
                pageOne(),
                pageTwo(),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: const Icon(Icons.arrow_back_ios),
                  onTap: () {
                    if (currentPage == 1) {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                    }
                  },
                ),
                Text("${currentPage + 1} / 2 "),
                GestureDetector(
                  child: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    if (currentPage == 0) {
                      if (validatePageOne()) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }

  Widget pageOne() {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter title';
                    }
                    return null;
                  },
                  controller: titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Title',
                  ),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter userId/email-address';
                  }
                  return null;
                },
                controller: userIdController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter UserID/ Email',
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Password',
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (value != passwordController.text) {
                    return 'Password are not matching';
                  }
                  return null;
                },
                controller: repassword,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Password Again',
                ),
              ),
              TextButton(
                onPressed: () {
                  if (validatePageOne()) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                  }
                },
                child: const Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget pageTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Row(
            children: [
              const Text("Added as Favorite : "),
              Switch(
                value: isFavorite,
                onChanged: ((value) {
                  setState(() => isFavorite = value);
                }),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 18),
          child: Text("Select type of password :"),
        ),
        const SizedBox(height: 12),
        ChipsChoice<int>.single(
          value: tag,
          wrapped: true,
          onChanged: (val) => setState(() => tag = val),
          choiceItems: C2Choice.listFrom<int, String>(
            source: options,
            value: (i, v) => i,
            label: (i, v) => v,
          ),
          choiceStyle: C2ChipStyle.filled(),
        ),
        const Spacer(),
        Center(
          child: TextButton(
            onPressed: () {
              var data = PasswordData(
                title: titleController.text,
                userId: userIdController.text,
                password: passwordController.text,
                isFavorite: isFavorite,
                type: tag + 1, // because all was remove in tags
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(data.toString())),
              );
              setState(() {
                passwordList.add(data);
              });
              Navigator.pop(context);
            },
            child: const Text("Add New Password"),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  bool validatePageOne() => _formKey.currentState!.validate();
}
