import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Constants/string_constants.dart';
import '../../../Controllers/news_controller.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    TextEditingController searchController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  hintText: StringConstants.searchBarHint,
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  border: InputBorder.none
              )
          )),
          Obx(() => newsController.isSearchNewsLoading.value
              ? Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
              : InkWell(
            onTap: () {
              newsController.searchNews(searchController.text);
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Icon(Icons.search,color: Colors.white,),
            ),
          )),
        ],
      ),
    );
  }
}
