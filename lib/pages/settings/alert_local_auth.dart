import 'package:flutter/material.dart';

Future<dynamic> alertMessage(BuildContext context) {
  return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Alert"),
          content: const Text(
              "Warning feature require user to setup biometeric / Lock Screen Security to be setup."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text("Continue"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      });
}
