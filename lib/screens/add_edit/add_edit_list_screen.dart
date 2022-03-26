import 'package:flutter/material.dart';
import 'package:portfolio_news_app/screens/editnews/select_news_screen.dart';

import '../addnews/add_news_screen.dart';

class AddEditListScreen extends StatelessWidget {
  String name;
  AddEditListScreen(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("${name}のニュース追加・編集"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("ニュース追加"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return AddNewsScreen(this.name);
                }),
              );
            },
          ),
          ListTile(
            title: Text("ニュース編集"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SelectNewsScreen(this.name);
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
