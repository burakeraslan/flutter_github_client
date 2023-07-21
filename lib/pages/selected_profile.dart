import 'package:flutter/material.dart';
import 'package:flutter_github_client/controllers/selected_profile_controller.dart';
import 'package:flutter_github_client/controllers/selected_user_repos.dart';
import 'package:flutter_github_client/pages/profile.dart';
import 'package:flutter_github_client/services/fetch_selected_user_repos.dart';
import 'package:get/get.dart';

class SelectedProfileScreen extends StatelessWidget {
  final selectedProfileController = Get.find<SelectedProfileController>();
  final selectedUserReposController = Get.find<SelectedUserReposController>();
  @override
  Widget build(BuildContext context) {
    final selectedProfile = selectedProfileController.selectedUserProfile.value;
    final selectedUsername = selectedProfile?.login.toString() ?? "-";
    final selectedPhoto = selectedProfile?.avatar_url.toString() ?? "-";
    final selectedFollowers = selectedProfile?.followers.toString() ?? "-";
    final selectedFollowing = selectedProfile?.following.toString() ?? "-";
    final selectedRepos = selectedProfile?.public_repos.toString() ?? "-";
    FetchSelectedUserRepos.fetchSelectedUserRepos();
    return Scaffold(
        appBar: AppBar(
          elevation: double.tryParse("0"),
          title: Text(
            selectedUsername,
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SelectedTopRow(
                  selectedPhoto: selectedPhoto,
                  selectedRepos: selectedRepos,
                  selectedFollowers: selectedFollowers,
                  selectedFollowing: selectedFollowing),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(top: 10),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: selectedUserReposController.repostories.length,
                    itemBuilder: (BuildContext context, int index) {
                      var selectedRepo =
                          selectedUserReposController.repostories.value[index];
                      var selectedRepoName = selectedRepo.name.toString();
                      var selectedRepoLanguage =
                          selectedRepo.language.toString();
                      var selectedRepoCreatedAt =
                          selectedRepo.created_at.toString();
                      var selectedRepoUpdatedAt =
                          selectedRepo.updated_at.toString();
                      return SelectedRepoRow(
                          selectedRepoName: selectedRepoName,
                          selectedRepoLanguage: selectedRepoLanguage,
                          selectedRepoCreatedAt: selectedRepoCreatedAt,
                          selectedRepoUpdatedAt: selectedRepoUpdatedAt);
                    }),
              ))
            ],
          ),
        ));
  }
}

class SelectedTopRow extends StatelessWidget {
  const SelectedTopRow({
    super.key,
    required this.selectedPhoto,
    required this.selectedRepos,
    required this.selectedFollowers,
    required this.selectedFollowing,
  });

  final String selectedPhoto;
  final String selectedRepos;
  final String selectedFollowers;
  final String selectedFollowing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(selectedPhoto),
          radius: 60,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(7),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(
                      onPressed: () {
                        print(selectedRepos.toString());
                      },
                      child: Text(
                        selectedRepos,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text("Repos")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Get.to(FollowersScreen());
                      },
                      child: Text(
                        selectedFollowers,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                    Text(
                      "Followers",
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Get.to(FollowingScreen());
                      },
                      child: Text(
                        selectedFollowing,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                    Text("Following")
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class SelectedRepoRow extends StatelessWidget {
  const SelectedRepoRow({
    super.key,
    required this.selectedRepoName,
    required this.selectedRepoLanguage,
    required this.selectedRepoCreatedAt,
    required this.selectedRepoUpdatedAt,
  });

  final String selectedRepoName;
  final String selectedRepoLanguage;
  final String selectedRepoCreatedAt;
  final String selectedRepoUpdatedAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 10),
      child: Column(children: [
        Row(
          children: [
            Icon(Icons.inbox),
            Text(
              " " + selectedRepoName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.language),
            Text(
              " " + selectedRepoLanguage,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            )
          ],
        ),
        Row(
          children: [
            Icon(Icons.create),
            Text(
              " " + selectedRepoCreatedAt,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            )
          ],
        ),
        Row(
          children: [
            Icon(Icons.update),
            Text(
              " " + selectedRepoUpdatedAt,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            )
          ],
        )
      ]),
    );
  }
}
