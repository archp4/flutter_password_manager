import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:pwd_mng/models/const.dart';

// ignore: must_be_immutable
class CDDNewPassword extends StatefulWidget {
  final void Function(String?) onChanged;
  String? selectedValue;
  CDDNewPassword({
    super.key,
    required this.onChanged,
    required this.selectedValue,
  });

  @override
  State<CDDNewPassword> createState() => _CDDNewPasswordState();
}

class _CDDNewPasswordState extends State<CDDNewPassword> {
  var typeList = passwordTypeList.skip(1);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          'Select Item',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: typeList
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: widget.selectedValue,
        onChanged: widget.onChanged,
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          width: 140,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
