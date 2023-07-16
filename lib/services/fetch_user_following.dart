import 'package:flutter_github_client/controllers/handle_username.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchUserFollowing {
  static Future<List<UserFollowing>> fetchFollowing() async {
    final usernameController = Get.find<HandleUsernameController>();
    var username = usernameController.username.value;
    final response = await http
        .get(Uri.parse('https://api.github.com/users/$username/following'));

    if (response.statusCode == 200) {
      final List<dynamic> following = json.decode(response.body);
      final List<UserFollowing> followingList =
          following.map((e) => UserFollowing.fromJson(e)).toList();
      return followingList;
    } else {
      throw Exception('Failed to fetch profile');
    }
  }
}

class UserFollowing {
  final String? login;
  final String? avatar_url;

  UserFollowing({required this.login, required this.avatar_url});

  factory UserFollowing.fromJson(Map<String, dynamic> json) {
    return UserFollowing(
      login: json["login"],
      avatar_url: json["avatar_url"],
    );
  }
}
