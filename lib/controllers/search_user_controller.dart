import 'package:flutter_github_client/services/fetch_search_user.dart';
import 'package:get/get.dart';

class SearchUserController extends GetxController {
  RxList<SearchUser> searchedList = RxList<SearchUser>();

  void updateSearchUser(List<SearchUser> newSearchUser) {
    searchedList.assignAll(newSearchUser);
  }
}
