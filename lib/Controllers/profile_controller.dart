import 'package:get/get.dart';

class ProfileController extends GetxController {
  var name = "Guest".obs;
  var email = "guest@gmail.com".obs;

  void updateProfile({required String newName, required String newEmail}) {
    name.value = newName;
    email.value = newEmail;
  }
}
