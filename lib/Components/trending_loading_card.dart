import 'package:flutter/material.dart';
import 'package:news_app/Components/loading_container.dart';

class TrendingLoadingCard extends StatelessWidget {
  const TrendingLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(5),
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          // Image placeholder
          LoadingContainer(width: double.infinity, height: 200),
          SizedBox(height: 10),

          // Tag and time placeholders
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LoadingContainer(width: 60, height: 10),
              LoadingContainer(width: 40, height: 10),
            ],
          ),
          SizedBox(height: 5),

          // Title placeholder
          LoadingContainer(width: double.infinity, height: 20),
          SizedBox(height: 5),
          LoadingContainer(width: 200, height: 20),

          SizedBox(height: 5),

          // Author placeholder
          Row(
            children: [
              SizedBox(width: 10),
              LoadingContainer(width: 30, height: 30), // For avatar
              SizedBox(width: 10),
              LoadingContainer(width: 100, height: 14),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
