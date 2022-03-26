import 'dart:io';

import 'package:flutter/material.dart';
import 'package:portfolio_news_app/models/news_list_model.dart';
import 'package:portfolio_news_app/models/news_model.dart';
import 'package:portfolio_news_app/widgets/news_card.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  String? newsKind;
  NewsScreen(this.newsKind);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: newsKind=="news"?null:AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(newsKind??""),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: ChangeNotifierProvider<NewsListModel>(
                  create: (_) => NewsListModel(newsKind)..fetchProductList(),
                  child:
                      Consumer<NewsListModel>(builder: (context, model, child) {
                    final List<NewsModel>? newsList = model.news;
                    if (newsList == null) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return NewsCard(newsList[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            height: 2.0,
                          );
                        },
                        itemCount: newsList.length);
                  })),
            ),
          ],
        ));
  }
}
