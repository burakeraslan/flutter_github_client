import 'package:flutter_github_client/services/fetch_selected_user_repos.dart';
import 'package:get/get.dart';

class SelectedUserReposController extends GetxController {
  RxList<SelectedUserRepos> repostories = RxList<SelectedUserRepos>();

  void updateSelectedUserRepos(List<SelectedUserRepos> repos) {
    repostories.assignAll(repos);
  }
}
