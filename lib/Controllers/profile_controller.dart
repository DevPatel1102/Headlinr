import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var name = "Guest".obs;
  var email = "guest@gmail.com".obs;
  var imagePath = "".obs;
  final _storage = GetStorage();
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    // Load saved data
    name.value = _storage.read('user_name') ?? "Guest";
    email.value = _storage.read('user_email') ?? "guest@gmail.com";
    imagePath.value = _storage.read('user_image') ?? "";
  }

  void updateProfile({required String newName, required String newEmail}) {
    name.value = newName;
    email.value = newEmail;

    // Save to storage
    _storage.write('user_name', newName);
    _storage.write('user_email', newEmail);
  }
  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
      _storage.write('user_image', pickedFile.path);
    }
  }
}
