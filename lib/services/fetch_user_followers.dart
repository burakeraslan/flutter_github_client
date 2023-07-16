import 'package:flutter_github_client/controllers/handle_username.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchUserFollowers {
  static Future<List<UserFollowers>> fetchFollowers() async {
    final usernameController = Get.find<HandleUsernameController>();
    var username = usernameController.username.value;
    final response = await http
        .get(Uri.parse('https://api.github.com/users/$username/followers'));

    if (response.statusCode == 200) {
      final List<dynamic> followers = json.decode(response.body);
      final List<UserFollowers> followersList =
          followers.map((e) => UserFollowers.fromJson(e)).toList();
      return followersList;
    } else {
      throw Exception('Failed to fetch profile');
    }
  }
}

class UserFollowers {
  final String? login;
  final String? avatar_url;

  UserFollowers({required this.login, required this.avatar_url});

  factory UserFollowers.fromJson(Map<String, dynamic> json) {
    return UserFollowers(
      login: json["login"],
      avatar_url: json["avatar_url"],
    );
  }
}
