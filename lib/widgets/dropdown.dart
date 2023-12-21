import 'package:flutter/material.dart';

import '../models/const.dart';

class MiniDropDown extends StatefulWidget {
  const MiniDropDown({required this.onChanged, super.key});
  final void Function(int) onChanged;

  @override
  State<MiniDropDown> createState() => _MiniDropDownState();
}

class _MiniDropDownState extends State<MiniDropDown> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          passwordTypeList[selectedIndex],
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        MenuAnchor(
          builder:
              (BuildContext context, MenuController controller, Widget? child) {
            return IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
              tooltip: 'Show menu',
            );
          },
          menuChildren: List<MenuItemButton>.generate(
            passwordTypeList.length,
            (int index) => MenuItemButton(
              onPressed: () {
                widget.onChanged(index);
                setState(() => selectedIndex = index);
              },
              child: Text(passwordTypeList[index]),
            ),
          ),
        ),
      ],
    );
  }
}
