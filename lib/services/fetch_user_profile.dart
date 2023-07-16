import 'package:flutter_github_client/controllers/handle_username.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchUserProfile {
  static Future<UserProfile> fetchProfile() async {
    final usernameController = Get.find<HandleUsernameController>();
    var username = usernameController.username.value;

    final response =
        await http.get(Uri.parse('https://api.github.com/users/$username'));

    if (response.statusCode == 200) {
      return UserProfile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch profile');
    }
  }
}

class UserProfile {
  final String? login;
  // final int? id;
  // final String? node_id;
  final String? avatar_url;
  // final String? gravatar_id;
  // final String? url;
  // final String? html_url;
  // final String? followers_url;
  // final String? following_url;
  // final String? gists_url;
  // final String? starred_url;
  // final String? subscriptions_url;
  // final String? organizations_url;
  // final String? repos_url;
  // final String? events_url;
  // final String? received_events_url;
  // final String? type;
  // final bool? site_admin;
  final String? name;
  // final String? company;
  // final String? blog;
  // final String? location;
  // final String? email;
  // final String? hireable;
  // final String? bio;
  // final String? twitter_username;
  final int? public_repos;
  // final int? public_gists;
  final int? followers;
  final int? following;
  // final String? created_at;
  // final String? updated_at;

  const UserProfile({
    required this.login,
    // required this.id,
    // required this.node_id,
    required this.avatar_url,
    // required this.gravatar_id,
    // required this.url,
    // required this.html_url,
    // required this.followers_url,
    // required this.following_url,
    // required this.gists_url,
    // required this.starred_url,
    // required this.subscriptions_url,
    // required this.organizations_url,
    // required this.repos_url,
    // required this.events_url,
    // required this.received_events_url,
    // required this.type,
    // required this.site_admin,
    required this.name,
    // required this.company,
    // required this.blog,
    // required this.location,
    // required this.email,
    // required this.hireable,
    // required this.bio,
    // required this.twitter_username,
    required this.public_repos,
    // required this.public_gists,
    required this.followers,
    required this.following,
    // required this.created_at,
    // required this.updated_at,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      login: json["login"],
      // id: json["id"],
      // node_id: json["node_id"],
      avatar_url: json["avatar_url"],
      // gravatar_id: json["gravatar_id"],
      // url: json["url"],
      // html_url: json["html_url"],
      // followers_url: json["followers_url"],
      // following_url: json["following_url"],
      // gists_url: json["gists_url"],
      // starred_url: json["starred_url"],
      // subscriptions_url: json["subscriptions_url"],
      // organizations_url: json["organizations_url"],
      // repos_url: json["repos_url"],
      // events_url: json["events_url"],
      // received_events_url: json["received_events_url"],
      // type: json["type"],
      // site_admin: json["site_admin"],
      name: json["name"],
      // company: json["company"],
      // blog: json["blog"],
      // location: json["location"],
      // email: json["email"],
      // hireable: json["hireable"],
      // bio: json["bio"],
      // twitter_username: json["twitter_username"],
      public_repos: json["public_repos"],
      // public_gists: json["public_gists"],
      followers: json["followers"],
      following: json["following"],
      // created_at: json["created_at"],
      // updated_at: json["updated_at"],
    );
  }
}
