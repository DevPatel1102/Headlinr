import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/NewsModel.dart';

class NewsController extends GetxController{

  RxList<NewsModel> trendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;

  void onInit() async{
    super.onInit();
    getTrendingNews();
    getNewsForYou();
  }

  Future<void> getTrendingNews() async{
    var baseURL = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=1df23bf25af94bbbbe9f639714d48ca0";

    try{
      var response = await http.get(Uri.parse(baseURL));
      // print(response);
      if(response.statusCode == 200){
        // print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for(var news in articles){
          trendingNewsList.add(NewsModel.fromJson(news));
        }
      }else{
        print("Something went wrong in Trending News");
      }
    }catch(error){
      print(error.toString());
    }
    // print(trendingNewsList);
  }

  Future<void> getNewsForYou() async{
    var baseURL = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=1df23bf25af94bbbbe9f639714d48ca0";

    try{
      var response = await http.get(Uri.parse(baseURL));
      // print(response);
      if(response.statusCode == 200){
        // print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for(var news in articles){
          newsForYouList.add(NewsModel.fromJson(news));
        }
      }else{
        print("Something went wrong in Trending News");
      }
    }catch(error){
      print(error.toString());
    }
    // print(trendingNewsList);
  }
}