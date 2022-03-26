
import 'package:flutter/material.dart';
import 'package:portfolio_news_app/widgets/custom_drawer.dart';

import 'news/news_screen.dart';
import 'title/title_screen.dart';

class TabScreens extends StatefulWidget {
  const TabScreens({Key? key}) : super(key: key);

  @override
  _TabScreensState createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[NewsScreen("news"), TitleScreen()];

  static const List<String> bar_name = <String>["ニュース", "ゲーム別"];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(bar_name[_selectedIndex]),
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.view_headline_sharp, color: Colors.white),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            label: 'ニュース',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_sidebar),
            //Statefulいける。値を保持し続けたいなら、IndexedStackを使う
            label: '新聞別',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
      drawer: CustomDrawer(),
    );
  }
}
