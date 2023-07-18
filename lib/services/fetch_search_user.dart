import 'dart:convert';
import 'package:flutter_github_client/controllers/handle_search_username.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FetchSearchUser {
  static Future<List<SearchUser>> fetchSearchUser() async {
    final searchUsernameContoller = Get.find<HandleSearchUsernameController>();
    var username = searchUsernameContoller.searchUsername.value;
    // print(username);
    final response = await http
        .get(Uri.parse("https://api.github.com/search/users?q=$username"));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      // print(jsonResponse);
      List<dynamic> items = jsonResponse["items"];
      List<SearchUser> searchUsers =
          items.map((item) => SearchUser.fromJson(item)).toList();
      return searchUsers;
    } else {
      throw Exception("Failed to fetch profile");
    }
  }
}

class SearchUser {
  final String? login;
  final String? avatar_url;

  SearchUser({required this.login, required this.avatar_url});

  factory SearchUser.fromJson(Map<String, dynamic> json) {
    return SearchUser(
      login: json["login"],
      avatar_url: json["avatar_url"],
    );
  }
}
