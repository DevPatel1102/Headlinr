import 'package:flutter/material.dart';
import 'package:news_app/Components/loading_container.dart';

class NewsTileLoadingCard extends StatelessWidget {
  const NewsTileLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Image placeholder
          LoadingContainer(width: 120, height: 120),

          SizedBox(width: 10),

          // Text and avatar placeholders
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Avatar placeholder
                    LoadingContainer(width: 24, height: 24),
                    SizedBox(width: 10),
                    // Author name placeholder
                    LoadingContainer(width: 100, height: 14),
                  ],
                ),
                SizedBox(height: 15),
                // Title placeholder
                LoadingContainer(width: double.infinity, height: 16),
                SizedBox(height: 5),
                LoadingContainer(width: 180, height: 16),
                SizedBox(height: 15),
                // Time placeholder
                LoadingContainer(width: 60, height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
