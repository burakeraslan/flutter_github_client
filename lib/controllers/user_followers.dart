import 'package:flutter_github_client/services/fetch_user_followers.dart';
import 'package:get/get.dart';

class UserFollowersController extends GetxController {
  RxList<UserFollowers> followers = RxList<UserFollowers>();

  void updateFollowers(List<UserFollowers> newFollowers) {
    followers.assignAll(newFollowers);
  }
}
