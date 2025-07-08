import 'package:flutter/material.dart';
import 'package:news_app/Controllers/news_controller.dart';
import 'package:news_app/Pages/ArticlePage/Widgets/search_bar_widget.dart';
import 'package:get/get.dart';
import 'package:news_app/Pages/NewsDetails/news_details.dart';
import '../HomePage/widgets/news_tile.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SearchBarWidget(),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  itemCount: newsController.searchNewsList.length,
                  itemBuilder: (context, index) {
                    final e = newsController.searchNewsList[index];
                    return NewsTile(
                      onTap: () {
                        Get.to(() => NewsDetailsPage(newsModel: e));
                      },
                      imgUrl: e.urlToImage ??
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRopP6o3MgMccuVFiFAIMizweHtlyG6Ju6y6g&s",
                      author: e.author ?? "Unknown",
                      title: e.title ?? "No Title",
                      time: e.publishedAt ?? "No Time",
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
