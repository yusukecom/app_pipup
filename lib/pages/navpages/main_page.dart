import 'package:pipupapp/pages/navpages/bar_function.dart';
import 'package:pipupapp/pages/home_page.dart';
import 'package:pipupapp/pages/navpages/my_page.dart';
import 'package:pipupapp/pages/navpages/search_page.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key:key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarFunction(),
    SearchPage(),
    MyPage()
  ];
  int currentIndex = 0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.cyanAccent,
      body: pages[0],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.cyan,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items:[
          BottomNavigationBarItem(label:"Home",icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label:"Bar",icon:Icon(Icons.bar_chart_sharp)),//BAR
          BottomNavigationBarItem(label:"Search",icon: Icon(Icons.search)),//SEARCH
          BottomNavigationBarItem(label:"My",icon: Icon(Icons.person)),//MY
        ]
      ),
    );
  }
}
