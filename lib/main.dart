import 'package:flutter/material.dart';
import 'package:flutter_github_client/pages/login.dart';
import 'package:get/get.dart';

void main() {
  runApp(FlutterGithubClientApp());
}

class FlutterGithubClientApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Github Client',
      home: LoginScreen(),
    );
  }
}
