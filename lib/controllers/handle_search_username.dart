import 'package:get/get.dart';

class HandleSearchUsernameController extends GetxController {
  RxString searchUsername = "".obs;

  void updateSearchUsername(String newValue) {
    searchUsername.value = newValue;
  }
}
