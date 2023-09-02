import 'package:flutter/material.dart';
import 'package:flutter_github_client/pages/home_page/home_page.dart';
import 'package:flutter_github_client/pages/login_page/login_page_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginPageController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: TextField(
            decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                labelText: "Username",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                )),
            onChanged: (value) {
              loginController.username.value = value;
            },
            onSubmitted: (value) async {
              if (value.isNotEmpty) {
                await loginController.fetchUserProfile();
                await loginController.fetchUserRepos();
                await loginController.fetchUserFollowers();
                await loginController.fetchUserFollowing();
                Get.to(const HomePage());
              }
            },
          ).paddingSymmetric(horizontal: 50),
        ));
  }
}
