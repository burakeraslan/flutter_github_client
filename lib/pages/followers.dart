import 'package:flutter/material.dart';
import 'package:flutter_github_client/controllers/handle_username.dart';
import 'package:flutter_github_client/controllers/user_followers.dart';
import 'package:flutter_github_client/pages/home.dart';
import 'package:get/get.dart';

class FollowersScreen extends StatelessWidget {
  final usernameController = Get.find<HandleUsernameController>();
  final followersController = Get.find<UserFollowersController>();
  @override
  Widget build(BuildContext context) {
    var username = usernameController.username.value;
    return Scaffold(
      appBar: AppBar(
        elevation: double.tryParse("0"),
        title: Text(
          username + "'s followers",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: followersController.followers.length,
          itemBuilder: (BuildContext context, int index) {
            var follower = followersController.followers.value[index];
            var photo = follower.avatar_url.toString();
            var login = follower.login.toString();
            return Card(
              elevation: double.tryParse("0"),
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(photo)),
                  title: Text(login),
                  onTap: () {
                    print(login);
                  },
                ),
              ),
            );
          }),
    );
  }
}
