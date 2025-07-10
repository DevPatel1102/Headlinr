import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Components/news_tile_loading_card.dart';
import 'package:news_app/Components/trending_loading_card.dart';
import 'package:news_app/Constants/string_constants.dart';
import 'package:news_app/Controllers/news_controller.dart';
import 'package:news_app/Pages/HomePage/widgets/news_tile.dart';
import 'package:news_app/Pages/HomePage/widgets/trending_card.dart';
import 'package:news_app/Pages/NewsDetails/news_details.dart';
import 'package:news_app/Pages/SeeAllNews/see_all_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.put(NewsController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringConstants.hottestNews,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => SeeAllNews(num: 0));
                            },
                            child: Text(
                              StringConstants.seeAll,
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
                                              StringConstants.placeholderImage,
                                          time: e.publishedAt ?? StringConstants.datePlaceholder,
                                          title: e.title ?? StringConstants.titlePlaceholder,
                                          author: e.author ?? StringConstants.authorPlaceholder,
                                          onTap: () {
                                            Get.to(
                                              () =>
                                                  NewsDetailsPage(newsModel: e),
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
                            StringConstants.todayBuzz,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => SeeAllNews(num: 1));
                            },
                            child: Text(
                              StringConstants.seeAll,
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
                                                StringConstants.placeholderImage,
                                        author: e.author ?? StringConstants.authorPlaceholder,
                                        title: e.title ?? StringConstants.titlePlaceholder,
                                        time: e.publishedAt ?? StringConstants.datePlaceholder,
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
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringConstants.appleNews,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => SeeAllNews(num: 2));
                            },
                            child: Text(
                              StringConstants.seeAll,
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
                                                  StringConstants.placeholderImage,
                                          time: e.publishedAt ?? StringConstants.datePlaceholder,
                                          title: e.title ?? StringConstants.titlePlaceholder,
                                          author: e.author ?? StringConstants.authorPlaceholder,
                                          onTap: () {
                                            Get.to(
                                              () =>
                                                  NewsDetailsPage(newsModel: e),
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
                            StringConstants.teslaNews,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => SeeAllNews(num: 3));
                            },
                            child: Text(
                              StringConstants.seeAll,
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
                                                StringConstants.placeholderImage,
                                        author: e.author ?? StringConstants.authorPlaceholder,
                                        title: e.title ?? StringConstants.titlePlaceholder,
                                        time: e.publishedAt ?? StringConstants.datePlaceholder,
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
