import 'package:flutter/material.dart';
import 'package:pwd_mng/models/const.dart';
import 'package:pwd_mng/pages/home/add_new_password.dart';
import 'package:pwd_mng/pages/search/allsearch.dart';
import 'package:pwd_mng/widgets/dropdown.dart';
import 'package:pwd_mng/widgets/password_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;
  var displayList = passwordList;
  filterList(index) {
    if (index == 0) {
      displayList = passwordList;
      return;
    }
    displayList = passwordList
        .where((passwordData) => passwordData.type == index)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            // showDialog(
            //   context: context,
            //   builder: (_) => const AddNewPasswordDialog(),
            // ).whenComplete(() {
            //   setState(() {});
            // });
            addNewPasswordSheet(context);
          },
        ),
        backgroundColor: Colors.blueAccent,
        title: MiniDropDown(
          onChanged: (index) {
            setState(() {
              selectedIndex = index;
              filterList(index);
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: AllSearchDelegate(
                  suggestions: passwordList,
                  hintText: 'Search Password By Title',
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          for (var password in displayList)
            PasswordTile(passwordDetail: password)
        ],
      ),
    );
  }
}
