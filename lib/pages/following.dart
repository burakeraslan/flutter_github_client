import 'package:flutter/material.dart';
import 'package:flutter_github_client/controllers/handle_username.dart';
import 'package:flutter_github_client/controllers/search_user_controller.dart';
import 'package:flutter_github_client/controllers/selected_profile_controller.dart';
import 'package:flutter_github_client/controllers/selected_user_repos.dart';
import 'package:flutter_github_client/controllers/selected_username_controller.dart';
import 'package:flutter_github_client/controllers/user_following.dart';
import 'package:flutter_github_client/pages/home.dart';
import 'package:flutter_github_client/pages/search.dart';
import 'package:flutter_github_client/pages/selected_profile.dart';
import 'package:flutter_github_client/services/fetch_search_user.dart';
import 'package:flutter_github_client/services/fetch_selected_user_profile.dart';
import 'package:flutter_github_client/services/fetch_selected_user_repos.dart';
import 'package:get/get.dart';

class FollowingScreen extends StatelessWidget {
  final usernameController = Get.find<HandleUsernameController>();
  final followingController = Get.find<UserFollowingController>();
  final selectedUsernameController = Get.find<SelectedUsernameController>();

  @override
  Widget build(BuildContext context) {
    var username = usernameController.username.value;
    return Scaffold(
      appBar: AppBar(
        elevation: double.tryParse("0"),
        title: Text(
          username + "'s following",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: followingController.following.length,
          itemBuilder: (BuildContext context, int index) {
            var following = followingController.following.value[index];
            var photo = following.avatar_url.toString();
            var login = following.login.toString();
            return Card(
              elevation: double.tryParse("0"),
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(photo)),
                  title: Text(login),
                  onTap: () async {
                    selectedUsernameController.updateSelectedUsername(login);
                    await selectedUserProfile();
                    await fetchSelectedUserRepo();
                    Get.to(SelectedProfileScreen());
                  },
                ),
              ),
            );
          }),
    );
  }

  Future fetchSearchUser() async {
    final searchUserController = Get.find<SearchUserController>();
    try {
      final list = await FetchSearchUser.fetchSearchUser();
      searchUserController.searchedList(list);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future selectedUserProfile() async {
    final selectedUserProfileController = Get.find<SelectedProfileController>();
    try {
      final selectedUserProfile =
          await FetchSelectedUserProfile.fetchSelectedUserProfile();
      selectedUserProfileController.updateSelectedProfile(selectedUserProfile);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future fetchSelectedUserRepo() async {
    final selectedUserReposController = Get.find<SelectedUserReposController>();
    try {
      final repostories = await FetchSelectedUserRepos.fetchSelectedUserRepos();
      selectedUserReposController.updateSelectedUserRepos(repostories);
    } catch (e) {
      print("Error: $e");
    }
  }
}
