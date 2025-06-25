import 'package:flutter/material.dart';
import 'package:news_app/Controllers/BottomNavigationController.dart';
import 'package:get/get.dart';

class MyBottomNav extends StatelessWidget {
  const MyBottomNav({super.key});

  @override
  Widget build(BuildContext context) {

    BottomNavController controller = Get.put(BottomNavController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: (0.2)), // subtle shadow color
                blurRadius: 12, // soft blur
                spreadRadius: 1,
                offset: Offset(0, 6), // vertical offset to look lifted
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  controller.index.value = 0;
                },
                child: Obx(()=>AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: controller.index.value == 0
                          ? Theme.of(context).colorScheme.primary
                          : null,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Center(
                    child: Icon(
                      Icons.home,
                      size: 25,
                      color: controller.index.value == 0
                          ? Colors.white
                          : Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                )),
              ),
              InkWell(
                onTap: (){
                  controller.index.value = 1;
                },
                child: Obx(()=>AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: controller.index.value == 1
                          ? Theme.of(context).colorScheme.primary
                          : null,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Center(
                    child: Icon(
                      Icons.book,
                      size: 25,
                      color: controller.index.value == 1
                          ? Colors.white
                          : Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                )),
              ),
              InkWell(
                onTap: (){
                  controller.index.value = 2;
                },
                child: Obx(()=>AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: controller.index.value == 2
                          ? Theme.of(context).colorScheme.primary
                          : null,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Center(
                    child:  Icon(
                      Icons.settings,
                      size: 25,
                      color: controller.index.value == 2
                          ? Colors.white
                          : Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
