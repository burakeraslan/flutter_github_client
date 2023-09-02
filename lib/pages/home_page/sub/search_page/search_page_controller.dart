import 'dart:convert';

import 'package:flutter_github_client/models/searched_users_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchPageController {
  RxString searchedUsername = "".obs;
  RxList<SearchedUsersModel> searchedUsers = <SearchedUsersModel>[].obs;

  Future<void> fetchSearchedUsers() async {
    final response = await http.get(
      Uri.parse("https://api.github.com/search/users?q=${searchedUsername.value}"), // Düzeltildi
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final users = (json["items"] as List).map((e) => SearchedUsersModel.fromJson(e)).toList(); // Düzeltildi
      searchedUsers.assignAll(users);
    } else {
      print("Error");
    }
  }
}
