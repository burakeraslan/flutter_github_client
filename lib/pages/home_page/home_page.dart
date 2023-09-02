import 'package:flutter/material.dart';
import 'package:flutter_github_client/pages/home_page/home_page_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homePageController = Get.put(HomePageController());
    return Scaffold(
        body: Obx(() => homePageController.pages[homePageController.index.value]),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: "Profile",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "Search",
                ),
              ],
              backgroundColor: Colors.white,
              currentIndex: homePageController.index.value,
              onTap: (index) {
                homePageController.changeIndex(index);
              },
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black45,
              iconSize: 26,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedIconTheme: const IconThemeData(size: 32),
              elevation: 0,
            )));
  }
}
