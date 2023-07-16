import 'package:flutter_github_client/services/fetch_user_profile.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  Rx<UserProfile?> userProfile = Rx<UserProfile?>(null);

  void updateProfile(UserProfile? profile) {
    userProfile.value = profile;
  }
}
