import 'package:get/get.dart';

class HandleUsernameController extends GetxController {
  RxString username = "".obs;

  void updateVariable(String newValue) {
    username.value = newValue;
  }
}
