import 'package:flutter/material.dart';
import 'package:news_app/Components/NavigationBar.dart';
import 'package:news_app/Pages/HomePage/widgets/NewsTile.dart';
import 'package:news_app/Pages/HomePage/widgets/TrendingCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Headlinr",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: MyBottomNav(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TrendingCard(
                      imageUrl:
                          "https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bmV3c3xlbnwwfHwwfHx8MA%3D%3D",
                      tag: "Trending no 1",
                      time: "2 Day Ago",
                      title: "Save Water Save Life",
                      author: "Nitish Kumar",
                    ),
                    TrendingCard(
                      imageUrl:
                          "https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bmV3c3xlbnwwfHwwfHx8MA%3D%3D",
                      tag: "Trending no 1",
                      time: "2 Day Ago",
                      title: "Save Water Save Life",
                      author: "Nitish Kumar",
                    ),
                  ],
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
              Column(
                children: [
                  NewsTile(
                    imgUrl:
                        "https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bmV3c3xlbnwwfHwwfHx8MA%3D%3D",
                    author: "Author",
                    title: "Save Water Save Life",
                    time: "2 Day ago",
                  ),
                  NewsTile(
                    imgUrl:
                        "https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bmV3c3xlbnwwfHwwfHx8MA%3D%3D",
                    author: "Author",
                    title: "Save Water Save Life",
                    time: "2 Day ago",
                  ),
                  NewsTile(
                    imgUrl:
                        "https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bmV3c3xlbnwwfHwwfHx8MA%3D%3D",
                    author: "Author",
                    title: "Save Water Save Life",
                    time: "2 Day ago",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
