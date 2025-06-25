import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/NewsModel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsController extends GetxController{

  RxList<NewsModel> trendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;

  void onInit() async{
    super.onInit();
    getTrendingNews();
    getNewsForYou();
  }

  Future<void> getTrendingNews() async{
    var baseURL = "${dotenv.env['TRENDING_URL']}&apiKey=${dotenv.env['NEWS_API_KEY']}";

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
    var baseURL = "${dotenv.env['NEWS_FOR_YOU_URL']}&apiKey=${dotenv.env['NEWS_API_KEY']}";

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