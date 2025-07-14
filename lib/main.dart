import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Config/theme.dart';
import 'package:news_app/Constants/string_constants.dart';
import 'package:news_app/home_page_controller.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

import 'Pages/SplashScreen/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.appName,
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      home: const SplashScreen(),
    );
  }
}

