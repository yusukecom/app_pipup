import 'package:pipupapp/pages/detail_page.dart';
import 'package:pipupapp/pages/home_page.dart';
import 'package:pipupapp/pages/navpages/main_page.dart';
import 'package:pipupapp/pages/page_1.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'プロジェクトポッチャマ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MainPage()
    );
  }
}