import 'package:flutter/material.dart';
import 'package:flutter_github_client/controllers/handle_search_username.dart';
import 'package:flutter_github_client/controllers/search_user_controller.dart';
import 'package:flutter_github_client/controllers/selected_profile_controller.dart';
import 'package:flutter_github_client/controllers/selected_username_controller.dart';
import 'package:flutter_github_client/services/fetch_search_user.dart';
import 'package:flutter_github_client/services/fetch_selected_user_profile.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(HandleSearchUsernameController());
    Get.put(SearchUserController());
    Get.put(SelectedUsernameController());
    Get.put(SelectedProfileController());
    final searchUsernameController = Get.find<HandleSearchUsernameController>();
    final searchUserController = Get.find<SearchUserController>();
    final selectedUsernameController = Get.find<SelectedUsernameController>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.search),
        title: Text(
          "Search",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
            // padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type here username...",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45, width: 1),
                ),
              ),
              onChanged: (value) {
                String handleSearchUsername = value;
                searchUsernameController
                    .updateSearchUsername(handleSearchUsername);
              },
              onSubmitted: (value) async {
                await fetchSearchUser();
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              return Container(
                margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 10), // padding: EdgeInsets.all(20),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: searchUserController.searchedList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var user = searchUserController.searchedList.value[index];
                      var login = user.login.toString();
                      var photo = user.avatar_url.toString();
                      return Card(
                        elevation: double.tryParse("0"),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: ListTile(
                            leading: CircleAvatar(
                                backgroundImage: NetworkImage(photo)),
                            title: Text(login),
                            onTap: () async {
                              selectedUsernameController
                                  .updateSelectedUsername(login);
                              await selectedUserProfile();
                            },
                          ),
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

  Future fetchSearchUser() async {
    final searchUserController = Get.find<SearchUserController>();
    try {
      final list = await FetchSearchUser.fetchSearchUser();
      searchUserController.searchedList(list);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future selectedUserProfile() async {
    final selectedUserProfileController = Get.find<SelectedProfileController>();
    try {
      final selectedUserProfile =
          await FetchSelectedUserProfile.fetchSelectedUserProfile();
      selectedUserProfileController.updateSelectedProfile(selectedUserProfile);
      print(selectedUserProfile.login);
    } catch (e) {
      print("Error: $e");
    }
  }
}
