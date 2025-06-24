import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Model/NewsModel.dart';

class NewsDetailsPage extends StatelessWidget {

  final NewsModel newsModel;

  const NewsDetailsPage({
    super.key,
    required this.newsModel,
  });

  @override
  Widget build(BuildContext context) {
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
                      onTap: (){
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
                SizedBox(height: 30,),
                Container(
                  height: 280,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            newsModel.urlToImage ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRopP6o3MgMccuVFiFAIMizweHtlyG6Ju6y6g&s",
                            fit: BoxFit.cover,
                          )
                        )
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                    newsModel.title ?? "No Title",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text(
                      newsModel.publishedAt  ?? "No Date",
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                      child: Text(
                        newsModel.author?[0] ?? "U",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      newsModel.author ?? "Unknown",
                      style: TextStyle(
                          fontSize: 18,
                        color: Theme.of(context).colorScheme.secondaryContainer
                      ),
                    )
                  ],
                ),
            
                SizedBox(height: 20,),
                Text(
                  newsModel.description ?? "No Description",
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.secondaryContainer
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
