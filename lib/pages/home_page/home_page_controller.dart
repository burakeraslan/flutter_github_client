import 'package:flutter_github_client/pages/home_page/sub/profile_page/profile_page.dart';
import 'package:flutter_github_client/pages/home_page/sub/search_page/search_page.dart';
import 'package:get/get.dart';

class HomePageController {
  // index
  RxInt index = 0.obs;

  // current index
  void changeIndex(int newIndex) {
    index.value = newIndex;
  }

  // pages
  final pages = [const ProfilePage(), const SearchPage()];
}
