import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final String time;
  final String title;
  final String author;
  final VoidCallback onTap;

  const TrendingCard({
    super.key,
    required this.imageUrl,
    required this.tag,
    required this.time,
    required this.title,
    required this.author,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(5),
        // height: 300,
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tag, style: Theme.of(context).textTheme.labelSmall),
                Text(time, style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
              height: 40,
              child: Row(
                children: [
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      author[0],
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      author,
                      maxLines: 2,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
