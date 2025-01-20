import 'package:features_tour/features_tour.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pwd_mng/helpers/password_helper.dart';
import 'package:pwd_mng/models/const.dart';
import 'package:pwd_mng/models/password_data.dart';
import 'package:pwd_mng/pages/password/edit_password.dart';

class ViewPassword extends StatefulWidget {
  final PasswordData passwordData;
  const ViewPassword({super.key, required this.passwordData});

  @override
  State<ViewPassword> createState() => _ViewPasswordState();
}

class _ViewPasswordState extends State<ViewPassword> {
  var observePassword = "";

  final tourController = FeaturesTourController('ViewPassword');

  bool isObserve = true;
  @override
  void initState() {
    tourController.start(context);
    super.initState();
    for (var i = 0; i < widget.passwordData.password.length; i++) {
      observePassword += "*";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.blueAccent,
        actions: [
          FeaturesTour(
            index: 0,
            controller: tourController,
            introduce: const Text('Edit Your Password Details'),
            child: IconButton(
              onPressed: () {
                editPasswordSheet(context, widget.passwordData);
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
          FeaturesTour(
            controller: tourController,
            index: 1,
            introduce: const Text(
                'Make It Your Favorite/Unfavorite By Selecting/Unselecting'),
            child: IconButton(
              onPressed: () {
                setState(() {
                  widget.passwordData.isFavorite =
                      !widget.passwordData.isFavorite;
                  context
                      .read<PasswordHelper>()
                      .updatePassword(widget.passwordData);
                });
              },
              icon: Icon(
                widget.passwordData.isFavorite ? Icons.star : Icons.star_border,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 3)
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    // backgroundColor: Colors.blueGrey,
                    child: Text(
                      widget.passwordData.title.substring(0, 1),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.passwordData.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 320,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.person),
                          title: const Text("ID/Username"),
                          subtitle: Text(widget.passwordData.userId),
                          trailing: FeaturesTour(
                            index: 3,
                            controller: tourController,
                            introduce: const Text("Copy Your ID/Username"),
                            child: IconButton(
                              onPressed: () async {
                                await Clipboard.setData(
                                  ClipboardData(
                                      text: widget.passwordData.userId),
                                );
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("ID/Username Copied")));
                              },
                              icon: const Icon(Icons.copy),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.password),
                          title: const Text("Password"),
                          subtitle: Text(
                            isObserve
                                ? observePassword
                                : widget.passwordData.password,
                            style: const TextStyle(),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FeaturesTour(
                                index: 5,
                                controller: tourController,
                                introduce:
                                    const Text("View/Hide Your Password"),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObserve = !isObserve;
                                    });
                                  },
                                  icon: isObserve
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                ),
                              ),
                              FeaturesTour(
                                index: 4,
                                controller: tourController,
                                introduce: const Text("Copy Your Password"),
                                child: IconButton(
                                  onPressed: () async {
                                    await Clipboard.setData(
                                      ClipboardData(
                                          text: widget.passwordData.password),
                                    );
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("Password Copied")));
                                  },
                                  icon: const Icon(Icons.copy),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.note),
                          title: const Text("Notes"),
                          subtitle: Text(
                            widget.passwordData.note != null
                                ? widget.passwordData.note!
                                : "No Note Added",
                            style: const TextStyle(),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.label_important),
                          title: const Text("Category"),
                          subtitle:
                              Text(passwordTypeList[widget.passwordData.type]),
                        ),
                      ],
                    ),
                  ),
                  FeaturesTour(
                    controller: tourController,
                    index: 2,
                    introduce: const Text("Delete Your Password Details"),
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<PasswordHelper>()
                            .removePassword(widget.passwordData);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
