import 'package:flutter/material.dart';
import 'package:news_app/Components/navigation_bar.dart';
import 'package:news_app/Controllers/bottom_navigation_controller.dart';
import 'package:get/get.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {

    BottomNavController controller = Get.put(BottomNavController());
    return Scaffold(
      floatingActionButton: MyBottomNav(),
      body: Obx(() => controller.pages[controller.index.value]),
    );
  }
}
