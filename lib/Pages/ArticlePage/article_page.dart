import 'package:flutter/material.dart';
import 'package:news_app/Controllers/news_controller.dart';
import 'package:news_app/Pages/ArticlePage/Widgets/search_bar_widget.dart';
import 'package:get/get.dart';
import 'package:news_app/Pages/NewsDetails/news_details.dart';
import '../../Constants/string_constants.dart';
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
            SizedBox(height: 10,),
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
                          StringConstants.placeholderImage,
                      author: e.author ?? StringConstants.authorPlaceholder,
                      title: e.title ?? StringConstants.titlePlaceholder,
                      time: e.publishedAt ?? StringConstants.datePlaceholder,
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
