import 'package:get/get.dart';

class SelectedUsernameController extends GetxController {
  RxString selectedUsername = "".obs;

  void updateSelectedUsername(String newValue) {
    selectedUsername.value = newValue;
  }
}
