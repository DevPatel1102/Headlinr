import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controllers/news_controller.dart';
import 'package:news_app/Model/news_model.dart';
import 'package:lottie/lottie.dart';

class NewsDetailsPage extends StatelessWidget {
  final NewsModel newsModel;

  const NewsDetailsPage({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.put(NewsController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        newsController.stop();
                        Get.back();
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back_ios_new),
                            Text("Back"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  height: 280,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            newsModel.urlToImage ??
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRopP6o3MgMccuVFiFAIMizweHtlyG6Ju6y6g&s",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  newsModel.title ?? "No Title",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      newsModel.publishedAt ?? "No Date",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                      child: Text(
                        newsModel.author?[0] ?? "U",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      newsModel.author ?? "Unknown",
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() => InkWell(
                            onTap: () {
                              newsController.isSpeaking.value
                                  ? newsController.stop()
                                  : newsController.speak(
                                newsModel.description ?? "No Description",
                              );
                            },
                            borderRadius: BorderRadius.circular(40),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainerHighest
                                    .withOpacity(0.2),
                              ),
                              child: Icon(
                                newsController.isSpeaking.value
                                    ? Icons.stop_rounded
                                    : Icons.play_arrow_rounded,
                                size: 35,
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ),
                        ),
                        Obx(
                              () => Lottie.asset(
                            'assets/Animations/textToSpeech.json',
                            height: 80,
                            // width: 100,
                            fit: BoxFit.contain,
                            animate: newsController.isSpeaking.value,
                          ),
                        ),
                      ],
                    ),
                ),
                SizedBox(height: 20),
                Text(
                  newsModel.description ?? "No Description",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
