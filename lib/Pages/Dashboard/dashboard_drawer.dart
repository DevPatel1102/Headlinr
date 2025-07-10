import 'dart:io';
import 'package:flutter/material.dart';
import 'package:news_app/Controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:news_app/Pages/ArticlePage/article_page.dart';
import 'package:news_app/Pages/ProfilePage/profile_page.dart';
import 'package:news_app/Pages/ProfileSettingsPage/profile_settings_page.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ProfileController profileController = Get.put(ProfileController());

    final userName = profileController.name.value;
    final userEmail = profileController.email.value;
    final imagePath = profileController.imagePath.value;

    return Drawer(
      child: Container(
        color: colorScheme.surface,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    backgroundImage: imagePath.isNotEmpty ? FileImage(File(imagePath)) : null,
                    child: imagePath.isEmpty
                        ? Icon(Icons.person, size: 50, color: Theme.of(context).colorScheme.onPrimaryContainer)
                        : null,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userEmail,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            // _buildDrawerItem(
            //   icon: Icons.article_outlined,
            //   text: 'Articles',
            //   onTap: () {
            //     Navigator.of(context).pop();
            //     Get.to(() => ArticlePage());
            //   },
            //   context: context,
            // ),
            _buildDrawerItem(
              icon: Icons.person,
              text: 'Profile',
              onTap: () {
                Navigator.of(context).pop();
                Get.to(() => ProfilePage());
              },
              context: context,
            ),
            _buildDrawerItem(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () {
                Navigator.of(context).pop();
                Get.to(() => ProfileSettingsPage());
              },
              context: context,
            ),
            const Divider(height: 32),
            // App version info
            Center(
              child: Text(
                "Headlinr • v1.0.0",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    required BuildContext context,
    Color? color,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(icon, color: color ?? colorScheme.primary),
      title: Text(
        text,
        style: TextStyle(
          color: color ?? colorScheme.onSurface,
        ),
      ),
      onTap: onTap,
    );
  }
}
