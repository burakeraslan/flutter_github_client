import 'package:flutter_github_client/services/fetch_selected_user_profile.dart';
import 'package:get/get.dart';

class SelectedProfileController extends GetxController {
  Rx<SelectedUserProfile?> selectedUserProfile = Rx<SelectedUserProfile?>(null);

  void updateSelectedProfile(SelectedUserProfile? profile) {
    selectedUserProfile.value = profile;
  }
}
