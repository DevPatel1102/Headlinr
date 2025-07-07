import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/news_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_tts/flutter_tts.dart';

class NewsController extends GetxController{

  RxList<NewsModel> trendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYou5 = <NewsModel>[].obs;
  RxList<NewsModel> appleNewsList = <NewsModel>[].obs;
  RxList<NewsModel> appleNews5 = <NewsModel>[].obs;
  RxList<NewsModel> teslaNewsList = <NewsModel>[].obs;
  RxList<NewsModel> teslaNews5 = <NewsModel>[].obs;
  RxBool isTrendingLoading = false.obs;
  RxBool isNewsForYouLoading = false.obs;
  RxBool isAppleNewsLoading = false.obs;
  RxBool isTeslaNewsLoading = false.obs;

  FlutterTts flutterTts = FlutterTts();
  RxBool isSpeaking = false.obs;
  var progress = 0.0.obs;
  Timer? _timer;

  @override
  void onInit() async{
    super.onInit();
    getTrendingNews();
    getNewsForYou();
    getAppleNews();
    getTeslaNews();
  }

  Future<void> getTrendingNews() async{
    var baseURL = "${dotenv.env['TRENDING_URL']}&apiKey=${dotenv.env['NEWS_API_KEY']}";
    isTrendingLoading.value = true;
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
        // print("Something went wrong in Trending News");
      }
    }catch(error){
      print(error.toString());
    }
    isTrendingLoading.value = false;
    // print(trendingNewsList);
  }

  Future<void> getNewsForYou() async{
    var baseURL = "${dotenv.env['NEWS_FOR_YOU_URL']}&apiKey=${dotenv.env['NEWS_API_KEY']}";
    isNewsForYouLoading.value = true;

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
        newsForYou5.value = newsForYouList.sublist(0,5).obs;
      }else{
        // print("Something went wrong in NewsSection");
      }
    }catch(error){
      print(error.toString());
    }
    isNewsForYouLoading.value = false;
    // print(trendingNewsList);
  }

  Future<void> getAppleNews() async{
    var baseURL = "${dotenv.env['APPLE_NEWS_URL']}&apiKey=${dotenv.env['NEWS_API_KEY']}";
    isAppleNewsLoading.value = true;

    try{
      var response = await http.get(Uri.parse(baseURL));
      // print(response);
      if(response.statusCode == 200){
        // print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for(var news in articles){
          appleNewsList.add(NewsModel.fromJson(news));
        }
        appleNews5.value = appleNewsList.sublist(0,5).obs;
      }else{
        // print("Something went wrong in Apple News");
      }
    }catch(error){
      print(error.toString());
    }
    isAppleNewsLoading.value = false;
    // print(trendingNewsList);
  }

  Future<void> getTeslaNews() async{
    var baseURL = "${dotenv.env['TESLA_NEWS_URL']}&apiKey=${dotenv.env['NEWS_API_KEY']}";
    isTeslaNewsLoading.value = true;
    try{
      var response = await http.get(Uri.parse(baseURL));
      // print(response);
      if(response.statusCode == 200){
        // print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for(var news in articles){
          teslaNewsList.add(NewsModel.fromJson(news));
        }
        teslaNews5.value = teslaNewsList.sublist(0,5).obs;
      }else{
        // print("Something went wrong in Tesla News");
      }
    }catch(error){
      print(error.toString());
    }
    isTeslaNewsLoading.value = false;
    // print(trendingNewsList);
  }

  Future<void> searchNews(String search) async {
    var baseURL = "${dotenv.env['SEARCH_URL']}$search&apiKey=${dotenv.env['NEWS_API_KEY']}";
    isNewsForYouLoading.value = true;

    try {
      var response = await http.get(Uri.parse(baseURL));
      // print(response);
      if (response.statusCode == 200) {
        // print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        newsForYouList.clear();
        int i = 0;
        for (var news in articles) {
          i++;
          newsForYouList.add(NewsModel.fromJson(news));
          if (i == 10) {
            break;
          }
        }
      } else {
        print("Something went wrong in search");
      }
    } catch (ex) {
      // print(ex);
    }
    isNewsForYouLoading.value = false;
  }

  Future<void> speak(String text) async {
    isSpeaking.value = true;

    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.4); 
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.speak(text);
    
    isSpeaking.value = false;
  }


  void stop() async {
    await flutterTts.stop();
    _timer?.cancel();
    progress.value = 0.0;
    isSpeaking.value = false;
  }
}