import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controllers/news_controller.dart';
import 'package:news_app/Model/news_model.dart';
import 'package:lottie/lottie.dart';

import '../../Constants/string_constants.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        height: 280,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            newsModel.urlToImage ??
                                StringConstants.placeholderImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        newsModel.title ?? StringConstants.titlePlaceholder,
                        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            newsModel.publishedAt ?? StringConstants.datePlaceholder,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Text(
                              newsModel.author?[0] ?? StringConstants.authorDefaultLetter,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              newsModel.author ?? StringConstants.authorPlaceholder,
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.secondaryContainer,
                              ),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(() => InkWell(
                              onTap: () {
                                newsController.isSpeaking.value
                                    ? newsController.stop()
                                    : newsController.speak(
                                  newsModel.description ?? StringConstants.descriptionPlaceholder,
                                );
                              },
                              borderRadius: BorderRadius.circular(40),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceContainerHighest
                                      .withAlpha(50),
                                ),
                                child: Icon(
                                  newsController.isSpeaking.value
                                      ? Icons.stop_rounded
                                      : Icons.play_arrow_rounded,
                                  size: 35,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                              ),
                            )),
                            Obx(
                                  () => Lottie.asset(
                                'assets/Animations/textToSpeech.json',
                                height: 80,
                                fit: BoxFit.contain,
                                animate: newsController.isSpeaking.value,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        newsModel.description ?? StringConstants.descriptionPlaceholder,
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.secondaryContainer,
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
