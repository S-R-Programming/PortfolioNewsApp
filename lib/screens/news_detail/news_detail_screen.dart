import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/news_model.dart';
import '../news/news_screen.dart';

class NewsDetailScreen extends StatelessWidget {
  NewsModel newsModel;

  NewsDetailScreen(this.newsModel);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("ニュース"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          newsModel.name,
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          newsModel.date,
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      newsModel.title,
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        //16:9の比率
                          width: 320,
                          height: 180,
                          child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(newsModel.newsImage))),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      newsModel.detail,
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
