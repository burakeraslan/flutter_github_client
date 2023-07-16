import 'package:flutter_github_client/services/fetch_user_following.dart';
import 'package:get/get.dart';

class UserFollowingController extends GetxController {
  RxList<UserFollowing> following = RxList<UserFollowing>();

  void updateFollowing(List<UserFollowing> newFollowing) {
    following.assignAll(newFollowing);
  }
}
