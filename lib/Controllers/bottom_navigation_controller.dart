import 'package:get/get.dart';
import 'package:news_app/Pages/ArticlePage/article_page.dart';
import 'package:news_app/Pages/HomePage/home_page.dart';
import 'package:news_app/Pages/ProfilePage/profile_page.dart';

class BottomNavController extends GetxController{

  RxInt index = 0.obs;

  var pages = [
    HomePage(),
    ArticlePage(),
    ProfilePage()
  ];
}