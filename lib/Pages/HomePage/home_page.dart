import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Components/NavigationBar.dart';
import 'package:news_app/Controllers/NewsController.dart';
import 'package:news_app/Pages/HomePage/widgets/NewsTile.dart';
import 'package:news_app/Pages/HomePage/widgets/TrendingCard.dart';
import 'package:news_app/Pages/NewsDetails/news_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Headlinr",
      //     style: Theme.of(context).textTheme.headlineLarge,
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(Icons.dashboard),
                  ),
                  Text(
                    "Headlinr",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(Icons.person),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => Row(
                    children:
                      newsController.trendingNewsList.map(
                        (e) => TrendingCard(
                          imageUrl: e.urlToImage ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRopP6o3MgMccuVFiFAIMizweHtlyG6Ju6y6g&s",
                          tag: "Trending no 1",
                          time: e.publishedAt  ?? "No Date",
                          title: e.title ?? "No Title",
                          author: e.author ?? "Unknown",
                          onTap: () {
                            Get.to(()=>NewsDetailsPage(
                              newsModel: e,
                            ));
                          },
                        ),
                      ).toList(),
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
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(() =>Column(
                  children: newsController.newsForYouList.map((e) =>
                      NewsTile(
                        imgUrl: e.urlToImage ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRopP6o3MgMccuVFiFAIMizweHtlyG6Ju6y6g&s",
                        author: e.author ?? "Unknown",
                        title: e.title ?? "No Title",
                        time: e.publishedAt ?? "No Date",
                        onTap: (){
                          Get.to(()=>NewsDetailsPage(newsModel: e,));
                        },
                      ),).toList()
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
