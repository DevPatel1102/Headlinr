import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controllers/profile_settings_controller.dart';

class ProfileSettingsPage extends StatelessWidget {
  ProfileSettingsPage({super.key});

  final ProfileSettingsController settingsController = Get.put(ProfileSettingsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top:false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Settings", style: Theme.of(context).textTheme.headlineMedium),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Obx(
                  () => SwitchListTile(
                title: Text(
                  "Dark Mode",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Text(
                  settingsController.isDarkMode.value ? "Enabled" : "Disabled",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                value: settingsController.isDarkMode.value,
                onChanged: settingsController.toggleTheme,
                activeColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            const Divider(height: 32),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text("About", style: Theme.of(context).textTheme.bodyLarge),
              subtitle: const Text("Version 1.0.0"),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: "Headlinr",
                  applicationVersion: "1.0.0",
                  applicationIcon: Icon(Icons.newspaper, size: 40, color: Theme.of(context).colorScheme.primary),
                  children: [
                    const SizedBox(height: 10),
                    Text("A fast and trending news app built using Flutter and GetX."),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
