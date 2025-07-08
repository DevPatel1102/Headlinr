import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/news_controller.dart';
import '../../Model/news_model.dart';
import '../HomePage/widgets/news_tile.dart';
import '../NewsDetails/news_details.dart';

class SeeAllNews extends StatelessWidget {
  final int num;

  const SeeAllNews({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.put(NewsController());
    RxList<NewsModel> getNewsListByNum(int num) {
      switch (num) {
        case 0:
          return newsController.trendingNewsList;
        case 1:
          return newsController.newsForYouList;
        case 2:
          return newsController.appleNewsList;
        case 3:
          return newsController.teslaNewsList;
        default:
          return newsController.newsForYouList;
      }
    }

    final RxList<NewsModel> selectedNewsList = getNewsListByNum(num);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      newsController.stop();
                      Get.back();
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.arrow_back_ios_new),
                        SizedBox(width: 4),
                        Text("Back"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: selectedNewsList.length,
                  itemBuilder: (context, index) {
                    final e = selectedNewsList[index];
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
