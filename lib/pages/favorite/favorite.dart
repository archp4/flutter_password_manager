import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwd_mng/helpers/password_helper.dart';
import 'package:pwd_mng/models/password_data.dart';
import 'package:pwd_mng/pages/search/allsearch.dart';
import 'package:pwd_mng/widgets/password_tile.dart';

class FavoriteHome extends StatefulWidget {
  const FavoriteHome({super.key});

  @override
  State<FavoriteHome> createState() => _FavoriteHomeState();
}

class _FavoriteHomeState extends State<FavoriteHome> {
  @override
  Widget build(BuildContext context) {
    var tempList = context.watch<PasswordHelper>().passwords ?? [];
    List<PasswordData> displayList = [];
    for (var password in tempList) {
      if (password.isFavorite) {
        displayList.add(password);
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text("Favorite"),
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
                    suggestions: displayList,
                    hintText: 'Search Password By Title',
                  ),
                );
              },
            ),
          ],
        ),
        body: displayList.isNotEmpty
            ? ListView(
                children: [
                  for (var password in displayList)
                    PasswordTile(passwordDetail: password)
                ],
              )
            : const Center(
                child: Text("No Favorite Password!!"),
              ));
  }
}
