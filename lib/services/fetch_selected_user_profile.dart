import 'package:flutter_github_client/controllers/selected_username_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchSelectedUserProfile {
  static Future<SelectedUserProfile> fetchSelectedUserProfile() async {
    final selectedUsernameController = Get.find<SelectedUsernameController>();
    var selectedUsername = selectedUsernameController.selectedUsername.value;
    final response = await http
        .get(Uri.parse("https://api.github.com/users/$selectedUsername"));

    if (response.statusCode == 200) {
      return SelectedUserProfile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetch profile");
    }
  }
}

class SelectedUserProfile {
  final String? login;
  final String? avatar_url;
  final String? name;
  final int? public_repos;

  final int? followers;
  final int? following;

  const SelectedUserProfile({
    required this.login,
    required this.avatar_url,
    required this.name,
    required this.public_repos,
    required this.followers,
    required this.following,
  });

  factory SelectedUserProfile.fromJson(Map<String, dynamic> json) {
    return SelectedUserProfile(
      login: json["login"],
      avatar_url: json["avatar_url"],
      name: json["name"],
      public_repos: json["public_repos"],
      followers: json["followers"],
      following: json["following"],
    );
  }
}
