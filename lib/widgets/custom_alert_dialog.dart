import 'package:flutter/material.dart';

class CustomAlertDialog {
  static Future<void> showSimpleMessage({
    required BuildContext context,
    required String message,
    String title = 'Alert',
    String buttonText = 'OK',
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(buttonText),
            ),
          ],
        );
      },
    );
  }

  static Future showSimpleExitMessage({
    required BuildContext context,
    String message = "Are you sure you want to exit with data unsaved?",
    String title = 'Alert',
    String button1Text = 'Yes',
    String button2Text = 'No',
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(button1Text),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(button2Text),
            ),
          ],
        );
      },
    );
  }

  static Future<void> showOptionsMessage({
    required BuildContext context,
    required String message,
    String title = 'Alert',
    String button1Text = 'OK',
    String button2Text = 'Cancel',
    required VoidCallback onProcess,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onProcess();
              },
              child: Text(button1Text),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(button2Text),
            ),
          ],
        );
      },
    );
  }
}

// Usage example:
// CustomAlertDialog.show(
//   context: context,
//   message: "Your alert message here"
// );
