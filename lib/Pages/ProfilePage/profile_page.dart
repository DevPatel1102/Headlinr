import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Pages/ProfileSettingsPage/profile_settings_page.dart';

import '../../Controllers/profile_controller.dart';
import '../EditProfilePage/edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: theme.textTheme.headlineMedium,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Header
          Center(
            child: Column(
              children: [
                Obx(() {
                  final imagePath = controller.imagePath.value;

                  return Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: theme.colorScheme.primary,
                        backgroundImage: imagePath.isNotEmpty ? FileImage(File(imagePath)) : null,
                        child: imagePath.isEmpty
                            ? Icon(Icons.person, size: 50, color: theme.colorScheme.onPrimaryContainer)
                            : null,
                      ),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: controller.pickImage,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black..withValues(alpha: (0.15)),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 10),
                Obx(() => Text(
                  controller.name.value,
                  style: theme.textTheme.headlineSmall,
                )),
                Obx(() => Text(
                  controller.email.value,
                  style: theme.textTheme.labelSmall,
                )),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Settings Navigation
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text("Settings", style: theme.textTheme.bodyLarge),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Get.to(() => ProfileSettingsPage()),
          ),

          // Edit Profile (Placeholder)
          ListTile(
            leading: const Icon(Icons.edit),
            title: Text("Edit Profile", style: theme.textTheme.bodyLarge),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Get.to(() => const EditProfilePage());
            },
          ),

          // // Logout
          // ListTile(
          //   leading: const Icon(Icons.logout),
          //   title: Text("Logout", style: theme.textTheme.bodyLarge),
          //   trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          //   onTap: () {
          //     // Add your logout logic here
          //     Get.defaultDialog(
          //       title: "Logout",
          //       content: const Text("Are you sure you want to logout?"),
          //       confirm: ElevatedButton(
          //         onPressed: () {
          //           Get.back(); // Close dialog
          //           // Perform logout logic
          //           Get.snackbar("Logged Out", "You have been logged out.");
          //         },
          //         child: const Text("Yes"),
          //       ),
          //       cancel: TextButton(
          //         onPressed: () => Get.back(),
          //         child: const Text("Cancel"),
          //       ),
          //     );
          //   },
          // ),

          const Divider(height: 32),

          // App version info
          Center(
            child: Text(
              "Headlinr • v1.0.0",
              style: theme.textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}
