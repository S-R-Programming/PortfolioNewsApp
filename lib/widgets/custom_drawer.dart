import 'package:flutter/material.dart';
import 'package:portfolio_news_app/screens/add_edit/confirm_screen.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
              alignment: Alignment.center,
              height: 50,
              child: DrawerHeader(child: Text("管理者画面"))),
          ListTile(
            title: Text("管理者認証"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ConfirmScreen();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}