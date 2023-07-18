import 'package:get/get.dart';

class HandleUsernameController extends GetxController {
  RxString username = "".obs;

  void updateUsername(String newValue) {
    username.value = newValue;
  }
}
