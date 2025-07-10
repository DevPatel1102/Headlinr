import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/string_constants.dart';
import '../../Controllers/profile_controller.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ProfileController controller = Get.find();

    final nameController = TextEditingController(text: controller.name.value);
    final emailController = TextEditingController(text: controller.email.value);

    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.editProfile, style: theme.textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: StringConstants.userNameLabel),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: StringConstants.userEmailLabel),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text("Save Changes"),
              onPressed: () {
                controller.updateProfile(
                  newName: nameController.text.trim(),
                  newEmail: emailController.text.trim(),
                );
                Get.back(); // Go back to profile page
              },
            )
          ],
        ),
      ),
    );
  }
}
