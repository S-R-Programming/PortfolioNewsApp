import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/news_model.dart';
import '../screens/editnews/edit_news_screen.dart';

class SelectNewsCard extends StatelessWidget {
  NewsModel newsModel;

  SelectNewsCard(this.newsModel);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return EditNewsScreen(newsModel);
          }),
        );
      },
      child: Container(
        height: 160,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      newsModel.title,
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),width: size.width*0.6,),
                  Container(
                    //4:3の比率
                      width: 80,
                      height: 60,
                      child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(newsModel.newsImage))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 20),
              child: Row(
                children: [
                  Text(
                    newsModel.name,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    newsModel.date,
                    style: TextStyle(color: Colors.grey),
                  ),
                  IconButton(onPressed: (){
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: Text("確認"),
                          content: Text("このニュースを削除しますか？"),
                          actions: <Widget>[
                            // ボタン領域
                            FlatButton(
                              child: Text("いいえ"),
                              onPressed: () => Navigator.pop(context),
                            ),
                            FlatButton(
                                child: Text("はい"),
                                onPressed: () {
                                  FirebaseFirestore.instance.collection('news').doc(newsModel.id).delete();
                                  FirebaseFirestore.instance.collection(newsModel.name).doc(newsModel.id).delete();
                                  Navigator.pop(context);
                                }
                            ),
                          ],
                        );
                      },
                    );
                  }, icon: Icon(Icons.delete))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
