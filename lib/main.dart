import 'package:code_ocean/core/localization/local.dart';
import 'package:code_ocean/core/services/services_locator.dart';
import 'package:code_ocean/ocean/presentation/screens/app_login_screen.dart';
import 'package:code_ocean/ocean/presentation/screens/app_schedule.dart';
import 'package:code_ocean/ocean/presentation/screens/app_timeline_screen.dart';
import 'package:code_ocean/ocean/presentation/screens/home_page_screen.dart';
import 'package:flutter/material.dart';



void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  AppLoginScreen(),
    );
  }
}

