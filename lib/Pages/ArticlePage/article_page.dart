import 'package:flutter/material.dart';
import 'package:news_app/Pages/ArticlePage/Widgets/SearchBarWidget.dart';

import '../HomePage/widgets/NewsTile.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              SearchBarWidget(),
              SizedBox(height: 20,),
              Column(
                children: [
                  // NewsTile(
                  //   imgUrl:
                  //   "https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bmV3c3xlbnwwfHwwfHx8MA%3D%3D",
                  //   author: "Author",
                  //   title: "Save Water Save Life",
                  //   time: "2 Day ago",
                  // ),
                  // NewsTile(
                  //   imgUrl:
                  //   "https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bmV3c3xlbnwwfHwwfHx8MA%3D%3D",
                  //   author: "Author",
                  //   title: "Save Water Save Life",
                  //   time: "2 Day ago",
                  // ),
                  // NewsTile(
                  //   imgUrl:
                  //   "https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bmV3c3xlbnwwfHwwfHx8MA%3D%3D",
                  //   author: "Author",
                  //   title: "Save Water Save Life",
                  //   time: "2 Day ago",
                  // ),
                  // NewsTile(
                  //   imgUrl:
                  //   "https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bmV3c3xlbnwwfHwwfHx8MA%3D%3D",
                  //   author: "Author",
                  //   title: "Save Water Save Life",
                  //   time: "2 Day ago",
                  // ),
                  // NewsTile(
                  //   imgUrl:
                  //   "https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bmV3c3xlbnwwfHwwfHx8MA%3D%3D",
                  //   author: "Author",
                  //   title: "Save Water Save Life",
                  //   time: "2 Day ago",
                  // ),
                  // NewsTile(
                  //   imgUrl:
                  //   "https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bmV3c3xlbnwwfHwwfHx8MA%3D%3D",
                  //   author: "Author",
                  //   title: "Save Water Save Life",
                  //   time: "2 Day ago",
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
