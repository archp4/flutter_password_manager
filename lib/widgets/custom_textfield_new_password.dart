import 'package:flutter/material.dart';

class CTFNewPassword extends StatelessWidget {
  final IconData iconData;
  final String label;
  final TextEditingController controller;
  const CTFNewPassword({
    super.key,
    required this.iconData,
    required this.label,
    required this.controller,
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
      maxLines: label == "Note" ? 2 : 1,
    );
  }
}
