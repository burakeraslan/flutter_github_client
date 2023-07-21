import 'dart:convert';
import 'package:flutter_github_client/controllers/selected_username_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FetchSelectedUserRepos {
  static Future<List<SelectedUserRepos>> fetchSelectedUserRepos() async {
    final selectedUsernameController = Get.find<SelectedUsernameController>();
    var selectedUsername = selectedUsernameController.selectedUsername.value;
    // print(selectedUsername);
    final response = await http
        .get(Uri.parse("https://api.github.com/users/$selectedUsername/repos"));

    if (response.statusCode == 200) {
      var data = response.body;
      var repos = jsonDecode(data);
      // print(repos[0]["name"]);
      final List<dynamic> repostories = repos;
      final List<SelectedUserRepos> reposList =
          repostories.map((repo) => SelectedUserRepos.fromJson(repo)).toList();
      return reposList;
    } else {
      throw Exception("Failed to fetch repos");
    }
  }
}

class SelectedUserRepos {
  final String? name;
  final String? language;
  final DateTime? created_at;
  final DateTime? updated_at;

  SelectedUserRepos({
    required this.name,
    required this.language,
    required this.created_at,
    required this.updated_at,
  });

  factory SelectedUserRepos.fromJson(Map<String, dynamic> json) {
    return SelectedUserRepos(
        name: json["name"],
        language: json["language"],
        created_at: DateTime.tryParse(json["created_at"]),
        updated_at: DateTime.tryParse(json["updated_at"]));
  }
}
