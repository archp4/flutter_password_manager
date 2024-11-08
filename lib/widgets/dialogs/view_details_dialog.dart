import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:pwd_mng/models/const.dart';
import 'package:pwd_mng/models/password_data.dart';

Dialog getViewDetailsDialog(
    {required BuildContext context, required PasswordData passwordDetail}) {
  return Dialog(
    shape: const RoundedRectangleBorder(), //this right here
    child: Stack(
      children: [
        Positioned(
          right: 0,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
        ),
        SizedBox(
          height: 300.0,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                padding: const EdgeInsets.only(
                  top: 2,
                  bottom: 4,
                  right: 6,
                  left: 6,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(passwordTypeList[passwordDetail.type]),
              ),
              CircleAvatar(
                radius: 28,
                child: Text(
                  passwordDetail.title.substring(0, 1),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                passwordDetail.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                passwordDetail.userId,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  AnimatedButton(
                    height: 40,
                    width: 140,
                    text: 'Copy UserId',
                    selectedText: 'Copied UserId',
                    selectedTextColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    selectedBackgroundColor: Colors.green,
                    transitionType: TransitionType.BOTTOM_TO_TOP,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    onPress: () {},
                  ),
                  AnimatedButton(
                    height: 40,
                    width: 140,
                    text: 'Copy Password',
                    selectedText: 'Copied Password',
                    backgroundColor: Colors.transparent,
                    selectedTextColor: Colors.white,
                    selectedBackgroundColor: Colors.green,
                    transitionType: TransitionType.BOTTOM_TO_TOP,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    onPress: () {},
                  ),
                ],
              ),
              AnimatedButton(
                height: 40,
                width: 300,
                text: 'Copy Both',
                selectedText: 'Copied Both',
                selectedTextColor: Colors.white,
                selectedBackgroundColor: Colors.green,
                backgroundColor: Colors.transparent,
                transitionType: TransitionType.BOTTOM_TO_TOP,
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                onPress: () {},
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Edit",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ],
    ),
  );
}
