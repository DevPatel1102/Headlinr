import 'dart:io';
import 'package:flutter/material.dart';
import 'package:news_app/Components/navigation_bar.dart';
import 'package:news_app/Controllers/bottom_navigation_controller.dart';
import 'package:get/get.dart';
import 'package:news_app/Pages/Dashboard/dashboard_drawer.dart';
import 'Controllers/profile_controller.dart';
import 'Pages/ProfilePage/profile_page.dart';

class HomePageController extends StatefulWidget {
  const HomePageController({super.key});

  @override
  State<HomePageController> createState() => _HomePageControllerState();
}

class _HomePageControllerState extends State<HomePageController> {
  final ProfileController profileController = Get.put(ProfileController());
  final BottomNavController controller = Get.put(BottomNavController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: scaffoldKey,
        appBar: (controller.index.value == 0)
            ? AppBar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                elevation: 0,
                scrolledUnderElevation: 0,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(16),
                  // height of your padding
                  child: SizedBox(height: 16), // actual bottom padding
                ),
                leading: Transform.translate(
                  offset: const Offset(8, 0), // Moves it right by 8 pixels
                  child: GestureDetector(
                    onTap: toggleDrawer,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.dashboard),
                    ),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        "Headlinr",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => ProfilePage());
                      },
                      child: Obx(() {
                        final imagePath = profileController.imagePath.value;
                        return CircleAvatar(
                          radius: 25,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          backgroundImage: imagePath.isNotEmpty
                              ? FileImage(File(imagePath))
                              : null,
                          child: imagePath.isEmpty
                              ? Icon(
                                  Icons.person,
                                  size: 25,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                                )
                              : null,
                        );
                      }),
                    ),
                  ],
                ),
              )
            : null,
        floatingActionButton: MyBottomNav(),
        drawer: const DashboardDrawer(),
        body: Obx(() => controller.pages[controller.index.value]),
      ),
    );
  }

  void toggleDrawer() {
    if (scaffoldKey.currentState!.isDrawerOpen) {
      Navigator.of(context).pop(); // Closes drawer
    } else {
      scaffoldKey.currentState!.openDrawer(); // Opens drawer
    }
  }
}
