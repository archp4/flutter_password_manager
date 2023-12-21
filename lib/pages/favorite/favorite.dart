import 'package:flutter/material.dart';
import 'package:pwd_mng/models/const.dart';
import 'package:pwd_mng/pages/search/allsearch.dart';
import 'package:pwd_mng/widgets/password_tile.dart';

class FavoriteHome extends StatefulWidget {
  const FavoriteHome({super.key});

  @override
  State<FavoriteHome> createState() => _FavoriteHomeState();
}

class _FavoriteHomeState extends State<FavoriteHome> {
  var displayList =
      passwordList.where((password) => password.isFavorite == true).toList();

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          for (var password in displayList)
            PasswordTile(passwordDetail: password)
        ],
      ),
    );
  }
}
