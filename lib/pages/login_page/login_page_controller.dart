import 'dart:convert';

import 'package:flutter_github_client/models/followers_following_model.dart';
import 'package:flutter_github_client/models/user_model.dart';
import 'package:flutter_github_client/models/user_repos_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginPageController {
  RxString username = "".obs;
  Rx<UserModel> userProfile = UserModel().obs;
  RxList<UserReposModel> userRepos = <UserReposModel>[].obs;
  RxList<FollowersFollowingModel> userFollowers = <FollowersFollowingModel>[].obs;
  RxList<FollowersFollowingModel> userFollowing = <FollowersFollowingModel>[].obs;

  // user's profile data
  Future<void> fetchUserProfile() async {
    final response = await http.get(
      Uri.parse("https://api.github.com/users/${username.value}"),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final user = UserModel.fromJson(json);
      userProfile.value = user;
    } else {
      print("Error");
    }
  }

  // user's repos data
  Future<void> fetchUserRepos() async {
    final response = await http.get(
      Uri.parse("https://api.github.com/users/${username.value}/repos"),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final repos = (json as List).map((e) => UserReposModel.fromJson(e)).toList();
      userRepos.assignAll(repos);
    } else {
      print("Error");
    }
  }

  // user's followers data
  Future<void> fetchUserFollowers() async {
    final response = await http.get(
      Uri.parse("https://api.github.com/users/${username.value}/followers"),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final followers = (json as List).map((e) => FollowersFollowingModel.fromJson(e)).toList();
      userFollowers.assignAll(followers);
    } else {
      print("Error");
    }
  }

  // user's following data
  Future<void> fetchUserFollowing() async {
    final response = await http.get(
      Uri.parse("https://api.github.com/users/${username.value}/following"),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final following = (json as List).map((e) => FollowersFollowingModel.fromJson(e)).toList();
      userFollowing.assignAll(following);
    } else {
      print("Error");
    }
  }
}
