import 'package:flutter/material.dart';
import 'package:flutter_github_client/controllers/handle_username.dart';
import 'package:flutter_github_client/controllers/user_following.dart';
import 'package:get/get.dart';

class FollowingScreen extends StatelessWidget {
  final usernameController = Get.find<HandleUsernameController>();
  final followingController = Get.find<UserFollowingController>();
  @override
  Widget build(BuildContext context) {
    var username = usernameController.username.value;
    return Scaffold(
      appBar: AppBar(
        elevation: double.tryParse("0"),
        leading: Icon(Icons.info_outline),
        title: Text(
          username + "'s following",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: followingController.following.length,
          itemBuilder: (BuildContext context, int index) {
            var following = followingController.following.value[index];
            var photo = following.avatar_url.toString();
            var login = following.login.toString();
            return Card(
              elevation: double.tryParse("1"),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(photo)),
                  title: Text(login),
                ),
              ),
            );
          }),
    );
  }
}
