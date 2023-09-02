import 'package:flutter/material.dart';
import 'package:flutter_github_client/pages/home_page/home_page.dart';
import 'package:flutter_github_client/pages/login_page/login_page_controller.dart';
import 'package:get/get.dart';

class FollowersPage extends StatelessWidget {
  const FollowersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginPageController = Get.put(LoginPageController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(loginPageController.userProfile.value.login.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            )),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: loginPageController.userFollowers.length,
          itemBuilder: (BuildContext context, int index) {
            var follower = loginPageController.userFollowers[index];
            var photo = follower.avatarUrl.toString();
            var login = follower.login.toString();
            return Card(
                elevation: 0,
                child: ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(photo)),
                  title: Text(login),
                  onTap: () async {
                    loginPageController.username.value = login;
                    await loginPageController.fetchUserProfile();
                    await loginPageController.fetchUserRepos();
                    await loginPageController.fetchUserFollowers();
                    await loginPageController.fetchUserFollowing();
                    Get.to(const HomePage());
                  },
                ));
          }),
    );
  }
}
