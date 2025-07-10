import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Constants/string_constants.dart';

class ProfileController extends GetxController {
  var name = StringConstants.defaultUserName.obs;
  var email = StringConstants.defaultUserEmail.obs;
  var imagePath = "".obs;
  final _storage = GetStorage();
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    // Load saved data
    name.value = _storage.read('user_name') ?? StringConstants.defaultUserName;
    email.value = _storage.read('user_email') ?? StringConstants.defaultUserEmail;
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
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Theme.of(Get.context!).colorScheme.primary,
            toolbarWidgetColor: Theme.of(Get.context!).colorScheme.onPrimary,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
            showCropGrid: true,
            cropFrameColor: Theme.of(Get.context!).colorScheme.onSurface,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
            ],
          ),
          IOSUiSettings(
            title: 'Crop Image',
            aspectRatioLockEnabled: false,
          ),
        ],
      );

      if (croppedFile != null) {
        imagePath.value = croppedFile.path;
        _storage.write('user_image', croppedFile.path);
      }
    }
  }
}
