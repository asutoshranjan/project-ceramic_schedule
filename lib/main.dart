import 'package:flutter/material.dart';
import 'package:schedule/screen/about_page.dart';
import 'package:schedule/screen/activities_page.dart';
import 'package:schedule/screen/exams_page.dart';
import 'package:schedule/screen/home_page.dart';
import 'package:schedule/screen/notice_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schedule',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/notice': (context) => NoticePage(),
        '/activities': (context) => ActivitiesPage(),
        '/exams': (context) => ExamsPage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
