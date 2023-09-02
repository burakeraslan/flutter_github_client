import 'package:flutter/material.dart';
import 'package:flutter_github_client/pages/home_page/home_page.dart';
import 'package:flutter_github_client/pages/home_page/home_page_controller.dart';
import 'package:flutter_github_client/pages/home_page/sub/search_page/search_page_controller.dart';
import 'package:flutter_github_client/pages/login_page/login_page_controller.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginPageController = Get.put(LoginPageController());
    final homePageController = Get.put(HomePageController());
    final searchPageController = Get.put(SearchPageController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.search),
        backgroundColor: Colors.white,
        title: const Text(
          "Search",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: "Type here username...",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45, width: 1),
              ),
            ),
            onSubmitted: (value) async {
              searchPageController.searchedUsername.value = value;
              await searchPageController.fetchSearchedUsers();
            },
          ).paddingOnly(top: 10, left: 20, right: 20),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(() {
              return Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10), // padding: EdgeInsets.all(20),
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: searchPageController.searchedUsers.length,
                    itemBuilder: (BuildContext context, int index) {
                      var user = searchPageController.searchedUsers[index];
                      var login = user.login.toString();
                      var photo = user.avatarUrl.toString();
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
                            homePageController.index.value = 0;
                            Get.to(const HomePage());
                          },
                        ),
                      );
                    }),
              );
            }),
          ),
        ],
      ),
    );
  }
}
