import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/news_model.dart';
import '../screens/news_detail/news_detail_screen.dart';

class NewsCard extends StatelessWidget {
  NewsModel newsModel;

  NewsCard(this.newsModel);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return NewsDetailScreen(newsModel);
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
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
                  ),width: size.width*0.6,),
                  Container(
                    //16:9の比率
                      width: 100,
                      height: 56.25,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
