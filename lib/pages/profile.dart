import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_github_client/controllers/user_followers.dart';
import 'package:flutter_github_client/controllers/user_profile.dart';
import 'package:flutter_github_client/controllers/user_repos.dart';
import 'package:flutter_github_client/pages/followers.dart';
import 'package:flutter_github_client/pages/following.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final userProfileController = Get.find<UserProfileController>();
  final userReposController = Get.find<UserReposController>();
  @override
  Widget build(BuildContext context) {
    var userProfile = userProfileController.userProfile.value;
    final username = userProfile?.login.toString() ?? "-";
    final photo = userProfile?.avatar_url.toString() ?? "-";
    final followers = userProfile?.followers.toString() ?? "-";
    final following = userProfile?.following.toString() ?? "-";
    final repos = userProfile?.public_repos.toString() ?? "-";

    return Scaffold(
        appBar: AppBar(
          elevation: double.tryParse("0"),
          leading: Icon(Icons.info_outline),
          title: Text(
            username,
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.redAccent,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TopRow(
                  photo: photo,
                  repos: repos,
                  followers: followers,
                  following: following),
              Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: userReposController.repositories.length,
                      itemBuilder: (BuildContext context, int index) {
                        var repo =
                            userReposController.repositories.value[index];
                        var repoName = repo.name.toString();
                        var repoLanguage = repo.language.toString();
                        var repoCreatedAt = repo.created_at.toString();
                        var repoUpdatedAt = repo.updated_at.toString();
                        return RepoRow(
                            repoName: repoName,
                            repoLanguage: repoLanguage,
                            repoCreatedAt: repoCreatedAt,
                            repoUpdatedAt: repoUpdatedAt);
                      }))
            ],
          ),
        ));
  }
}

class TopRow extends StatelessWidget {
  const TopRow({
    super.key,
    required this.photo,
    required this.repos,
    required this.followers,
    required this.following,
  });

  final String photo;
  final String repos;
  final String followers;
  final String following;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(photo),
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
                        // print("Repos");
                        print(followers.toString());
                      },
                      child: Text(
                        repos,
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
                        Get.to(FollowersScreen());
                      },
                      child: Text(
                        followers,
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
                        Get.to(FollowingScreen());
                      },
                      child: Text(
                        following,
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

class RepoRow extends StatelessWidget {
  const RepoRow({
    super.key,
    required this.repoName,
    required this.repoLanguage,
    required this.repoCreatedAt,
    required this.repoUpdatedAt,
  });

  final String repoName;
  final String repoLanguage;
  final String repoCreatedAt;
  final String repoUpdatedAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 10),
      child: Column(children: [
        Row(
          children: [
            Icon(Icons.inbox),
            Text(
              " " + repoName,
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
              " " + repoLanguage,
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
              " " + repoCreatedAt,
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
              " " + repoUpdatedAt,
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
