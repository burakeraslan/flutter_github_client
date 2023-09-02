import 'package:flutter/material.dart';
import 'package:flutter_github_client/pages/login_page/login_page_controller.dart';
import 'package:flutter_github_client/widgets/repo_row.dart';
import 'package:flutter_github_client/widgets/top_row.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginPageController = Get.put(LoginPageController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Icon(Icons.person, color: Colors.black),
          title: Text(loginPageController.userProfile.value.login.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              )),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TopRow(
                  photo: loginPageController.userProfile.value.avatarUrl.toString(),
                  repos: loginPageController.userProfile.value.publicRepos.toString(),
                  followers: loginPageController.userProfile.value.followers.toString(),
                  following: loginPageController.userProfile.value.following.toString()),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: loginPageController.userRepos.length,
                    itemBuilder: (BuildContext context, int index) {
                      var repo = loginPageController.userRepos.value[index];
                      var repoName = repo.name.toString();
                      var repoLanguage = repo.language.toString();
                      var repoCreatedAt = repo.created_at.toString();
                      var repoUpdatedAt = repo.updated_at.toString();
                      return RepoRow(repoName: repoName, repoLanguage: repoLanguage, repoCreatedAt: repoCreatedAt, repoUpdatedAt: repoUpdatedAt);
                    }),
              ))
            ],
          ),
        ));
  }
}
