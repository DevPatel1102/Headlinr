import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {

  final String imgUrl;
  final String author;
  final String title;
  final String time;
  final VoidCallback onTap;

  const NewsTile({
    super.key,
    required this.imgUrl,
    required this.author,
    required this.title,
    required this.time,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
              ), child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                  ),
                )
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.primary,
                        child: Text(
                          author.isNotEmpty ? author[0] : 'U',
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
                  SizedBox(height: 15),
                  Text(title, maxLines: 2),
                  SizedBox(height: 15),
                  Text(time, style: Theme.of(context).textTheme.labelSmall,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
