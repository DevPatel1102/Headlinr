import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Components/news_tile_loading_card.dart';
import 'package:news_app/Components/trending_loading_card.dart';
import 'package:news_app/Controllers/news_controller.dart';
import 'package:news_app/Pages/HomePage/widgets/news_tile.dart';
import 'package:news_app/Pages/HomePage/widgets/trending_card.dart';
import 'package:news_app/Pages/NewsDetails/news_details.dart';
import 'package:news_app/Pages/ProfilePage/profile_page.dart';
import 'package:news_app/Pages/SeeAllNews/see_all_news.dart';
import '../../Controllers/profile_controller.dart';
import '../Dashboard/dashboard_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.put(NewsController());
    final ProfileController profileController = Get.put(ProfileController());

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    void toggleDrawer() {
      if (scaffoldKey.currentState!.isDrawerOpen) {
        Navigator.of(context).pop(); // Closes drawer
      } else {
        scaffoldKey.currentState!.openDrawer(); // Opens drawer
      }
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Headlinr",
      //     style: Theme.of(context).textTheme.headlineLarge,
      //   ),
      // ),
      key: scaffoldKey, // Assign the global key
      drawer: const DashboardDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
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
                  Text(
                    "Headlinr",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => ProfilePage());
                    },
                    child: Obx(() {
                      final imagePath = profileController.imagePath.value;
                      return CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        backgroundImage: imagePath.isNotEmpty
                            ? FileImage(File(imagePath))
                            : null,
                        child: imagePath.isEmpty
                            ? Icon(
                          Icons.person,
                          size: 25,
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        )
                            : null,
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hottest News",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(() => SeeAllNews(num: 0));
                            },
                            child: Text(
                              "See All",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Obx(
                              () => newsController.isTrendingLoading.value
                              ? const Row(
                            children: [
                              TrendingLoadingCard(),
                              TrendingLoadingCard(),
                            ],
                          )
                              : Row(
                            children: newsController.trendingNewsList
                                .map(
                                  (e) => TrendingCard(
                                imageUrl:
                                e.urlToImage ??
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRopP6o3MgMccuVFiFAIMizweHtlyG6Ju6y6g&s",
                                tag: "Trending no 1",
                                time: e.publishedAt ?? "No Date",
                                title: e.title ?? "No Title",
                                author: e.author ?? "Unknown",
                                onTap: () {
                                  Get.to(
                                        () => NewsDetailsPage(newsModel: e),
                                  );
                                },
                              ),
                            )
                                .toList(),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "News For You",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(() => SeeAllNews(num: 1));
                            },
                            child: Text(
                              "See All",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Obx(
                            () => newsController.isNewsForYouLoading.value
                            ? Column(
                          children: [
                            NewsTileLoadingCard(),
                            NewsTileLoadingCard(),
                          ],
                        )
                            : Column(
                          children: newsController.newsForYou5
                              .map(
                                (e) => NewsTile(
                              imgUrl:
                              e.urlToImage ??
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRopP6o3MgMccuVFiFAIMizweHtlyG6Ju6y6g&s",
                              author: e.author ?? "Unknown",
                              title: e.title ?? "No Title",
                              time: e.publishedAt ?? "No Date",
                              onTap: () {
                                Get.to(() => NewsDetailsPage(newsModel: e));
                              },
                            ),
                          )
                              .toList(),
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Apple News",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(() => SeeAllNews(num: 2));
                            },
                            child: Text(
                              "See All",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Obx(
                              () => newsController.isAppleNewsLoading.value
                              ? Row(
                            children: [
                              TrendingLoadingCard(),
                              TrendingLoadingCard(),
                            ],
                          )
                              : Row(
                            children: newsController.appleNews5
                                .map(
                                  (e) => TrendingCard(
                                imageUrl:
                                e.urlToImage ??
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRopP6o3MgMccuVFiFAIMizweHtlyG6Ju6y6g&s",
                                tag: "Trending no 1",
                                time: e.publishedAt ?? "No Date",
                                title: e.title ?? "No Title",
                                author: e.author ?? "Unknown",
                                onTap: () {
                                  Get.to(
                                        () => NewsDetailsPage(newsModel: e),
                                  );
                                },
                              ),
                            )
                                .toList(),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tesla News",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(() => SeeAllNews(num: 3));
                            },
                            child: Text(
                              "See All",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Obx(
                            () => newsController.isTeslaNewsLoading.value
                            ? Column(
                          children: [
                            NewsTileLoadingCard(),
                            NewsTileLoadingCard(),
                          ],
                        )
                            : Column(
                          children: newsController.teslaNews5
                              .map(
                                (e) => NewsTile(
                              imgUrl:
                              e.urlToImage ??
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRopP6o3MgMccuVFiFAIMizweHtlyG6Ju6y6g&s",
                              author: e.author ?? "Unknown",
                              title: e.title ?? "No Title",
                              time: e.publishedAt ?? "No Date",
                              onTap: () {
                                Get.to(() => NewsDetailsPage(newsModel: e));
                              },
                            ),
                          )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
