import 'package:flutter/material.dart';
import 'package:flutter_github_client/pages/home_page/sub/profile_page/sub/followers_page/followers_page.dart';
import 'package:flutter_github_client/pages/home_page/sub/profile_page/sub/following_page/following_page.dart';
import 'package:get/get.dart';

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
                        print(repos.toString());
                      },
                      child: Text(
                        repos,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Text("Repos")
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
                        Get.to(const FollowersPage());
                      },
                      child: Text(
                        followers,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                      ),
                    ),
                    const Text(
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
                        Get.to(const FollowingPage());
                      },
                      child: Text(
                        following,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                      ),
                    ),
                    const Text("Following")
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
