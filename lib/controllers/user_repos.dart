import 'package:flutter_github_client/services/fetch_user_repos.dart';
import 'package:get/get.dart';

class UserReposController extends GetxController {
  RxList<UserRepos> repositories = RxList<UserRepos>();

  void updateRepos(List<UserRepos> repos) {
    repositories.assignAll(repos);
  }
}
