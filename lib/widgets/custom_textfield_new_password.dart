import 'package:flutter/material.dart';

class CTFNewPassword extends StatelessWidget {
  final IconData iconData;
  final String label;
  final TextEditingController controller;
  final String validationText;
  const CTFNewPassword({
    super.key,
    required this.iconData,
    required this.label,
    required this.controller,
    required this.validationText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(label),
        prefixIcon: Icon(iconData),
      ),
      validator: (value) {
        if (label == "Note") {
          return null;
        }
        if (value == null || value.isEmpty) {
          return validationText;
        }
        return null;
      },
      maxLines: label == "Note" ? 2 : 1,
    );
  }
}
