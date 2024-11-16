import 'package:flutter/material.dart';
import 'package:pwd_mng/models/password_data.dart';
import 'package:pwd_mng/widgets/password_tile.dart';

class AllSearchDelegate extends SearchDelegate {
  final List<PasswordData> suggestions;
  final String? hintText;
  AllSearchDelegate({this.hintText, required this.suggestions});

  @override
  String? get searchFieldLabel => hintText;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios_new),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<PasswordData> matchingPassword = [];
    for (var password in suggestions) {
      if (password.title.toLowerCase().contains(query.toLowerCase())) {
        matchingPassword.add(password);
      }
    }
    return ListView.builder(
      itemCount: matchingPassword.length,
      itemBuilder: (ctx, index) {
        return PasswordTile(passwordDetail: matchingPassword[index]);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<PasswordData> matchingPassword = [];
    for (var password in suggestions) {
      if (password.title.toLowerCase().contains(query.toLowerCase())) {
        matchingPassword.add(password);
      }
    }
    return ListView.builder(
      itemCount: matchingPassword.length,
      itemBuilder: (ctx, index) {
        return PasswordTile(passwordDetail: matchingPassword[index]);
      },
    );
  }
}
