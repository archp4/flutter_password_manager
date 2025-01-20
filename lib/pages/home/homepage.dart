import 'package:features_tour/features_tour.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwd_mng/helpers/list_helper.dart';
import 'package:pwd_mng/helpers/password_helper.dart';
import 'package:pwd_mng/models/password_data.dart';
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
  final tourController = FeaturesTourController('HomePage');
  List? displayList = [];
  int selectedIndex = 0;
  filterList(index, List<PasswordData>? passwordList) {
    if (passwordList != null) {
      if (index == 0) {
        displayList = passwordList;
        return;
      }
      displayList = passwordList
          .where((passwordData) => passwordData.type == index)
          .toList();
    }
  }

  @override
  void initState() {
    tourController.start(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    selectedIndex = context.watch<ListHelper>().selectedIndex;
    var passwordList = context.watch<PasswordHelper>().passwords;
    filterList(selectedIndex, passwordList);

    return Scaffold(
      appBar: AppBar(
        leading: FeaturesTour(
          controller: tourController,
          introduce: const Text('Use this button To Add new Password'),
          index: 0,
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () async {
              addNewPasswordSheet(context);
            },
          ),
        ),
        backgroundColor: Colors.blueAccent,
        title: FeaturesTour(
          controller: tourController,
          index: 1,
          introduce: const Text('Sort Password by Type'),
          child: MiniDropDown(
              onChanged: (index) =>
                  context.read<ListHelper>().changeIndex(index)),
        ),
        actions: [
          FeaturesTour(
            controller: tourController,
            index: 2,
            introduce: const Text("Space Where You find Your Password"),
            child: IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: AllSearchDelegate(
                    suggestions: passwordList!,
                    hintText: 'Search Password By Title',
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: displayList!.isNotEmpty
          ? ListView(
              children: [
                for (var password in displayList!)
                  PasswordTile(passwordDetail: password)
              ],
            )
          : const Center(
              child: Text("No Password Found!!\n Add New Entry!!"),
            ),
    );
  }
}
