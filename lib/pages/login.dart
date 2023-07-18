import 'package:flutter/material.dart';
import 'package:flutter_github_client/controllers/handle_username.dart';
import 'package:flutter_github_client/controllers/user_following.dart';
import 'package:flutter_github_client/controllers/user_profile.dart';
import 'package:flutter_github_client/controllers/user_repos.dart';
import 'package:flutter_github_client/controllers/user_followers.dart';
import 'package:flutter_github_client/pages/home.dart';
import 'package:flutter_github_client/services/fetch_user_followers.dart';
import 'package:flutter_github_client/services/fetch_user_following.dart';
import 'package:flutter_github_client/services/fetch_user_profile.dart';
import 'package:flutter_github_client/services/fetch_user_repos.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _SearchBox(),
        ],
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final handleUsernameController = Get.put(HandleUsernameController());
    final userProfileController = Get.put(UserProfileController());
    final userReposController = Get.put(UserReposController());
    final userFollowersController = Get.put(UserFollowersController());
    final userFollowingController = Get.put(UserFollowingController());

    return Card(
      margin: EdgeInsets.all(20),
      elevation: double.tryParse("0"),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 40, bottom: 40, left: 20, right: 20),
        child: TextField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 3.5),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent, width: 3.5),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              labelText: "Username",
              labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: double.tryParse("20"),
              )),
          onChanged: (value) {
            String handleUsername = value;
            handleUsernameController.updateUsername(handleUsername);
          },
          onSubmitted: (value) async {
            await fetchUserProfile();
            await fetchUserRepo();
            await fetchUserFollowers();
            await fetchUserFollowing();
            Get.to(HomeScreen());
          },
        ),
      ),
    );
  }

  Future fetchUserProfile() async {
    final userProfileController = Get.find<UserProfileController>();
    try {
      final profile = await FetchUserProfile.fetchProfile();
      userProfileController.updateProfile(profile);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future fetchUserRepo() async {
    final userReposController = Get.find<UserReposController>();
    try {
      final repositories = await FetchUserRepos.fetchRepos();
      userReposController.updateRepos(repositories);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future fetchUserFollowers() async {
    final userFollowersController = Get.find<UserFollowersController>();
    try {
      final followers = await FetchUserFollowers.fetchFollowers();
      userFollowersController.updateFollowers(followers);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future fetchUserFollowing() async {
    final userFollowingController = Get.find<UserFollowingController>();
    try {
      final following = await FetchUserFollowing.fetchFollowing();
      userFollowingController.updateFollowing(following);
    } catch (e) {
      print("Error: $e");
    }
  }
}
