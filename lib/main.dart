import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_recommender/screen/home_screen.dart';
import 'package:job_recommender/utils/colors.dart';
import 'package:job_recommender/utils/get_it.dart';
import 'package:job_recommender/utils/theme.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Locator.setup();  

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, 
    statusBarColor: CustomeColors.kPrimaryColor
  ));
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.theme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

