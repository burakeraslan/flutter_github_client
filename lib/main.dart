import 'package:flutter/material.dart';
import 'package:flutter_github_client/pages/login_page/login_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const FlutterGithubClientApp());
}

class FlutterGithubClientApp extends StatelessWidget {
  const FlutterGithubClientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: "Github Client",
      home: LoginPage(),
    );
  }
}
