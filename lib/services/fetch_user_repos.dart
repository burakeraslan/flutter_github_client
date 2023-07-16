import 'package:flutter_github_client/controllers/handle_username.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchUserRepos {
  static Future<List<UserRepos>> fetchRepos() async {
    final usernameController = Get.find<HandleUsernameController>();
    var username = usernameController.username.value;

    final response = await http
        .get(Uri.parse('https://api.github.com/users/$username/repos'));

    if (response.statusCode == 200) {
      final List<dynamic> repositories = json.decode(response.body);
      final List<UserRepos> reposList =
          repositories.map((repo) => UserRepos.fromJson(repo)).toList();
      return reposList;
    } else {
      throw Exception('Failed to fetch profile');
    }
  }
}

class UserRepos {
  final String? name;
  final String? language;
  final DateTime? created_at;
  final DateTime? updated_at;

  UserRepos({
    required this.name,
    required this.language,
    required this.created_at,
    required this.updated_at,
  });

  factory UserRepos.fromJson(Map<String, dynamic> json) {
    return UserRepos(
        name: json["name"],
        language: json["language"],
        created_at: DateTime.tryParse(json["created_at"]),
        updated_at: DateTime.tryParse(json["updated_at"]));
  }
}
