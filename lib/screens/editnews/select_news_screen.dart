import 'package:flutter/material.dart';
import 'package:portfolio_news_app/models/news_list_model.dart';
import 'package:portfolio_news_app/models/news_model.dart';
import 'package:portfolio_news_app/widgets/select_news_card.dart';
import 'package:provider/provider.dart';

class SelectNewsScreen extends StatelessWidget {
  String name;
  SelectNewsScreen(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("ニュース選択"),
      ),
        backgroundColor: Colors.white,
        body: ChangeNotifierProvider<NewsListModel>(
            create: (_) =>
            NewsListModel(this.name)
              ..fetchProductList(),
            child: Consumer<NewsListModel>(builder: (context, model, child) {
              final List<NewsModel>? newsList = model.news;
              if (newsList == null) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return SelectNewsCard(newsList[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 1.0,
                    );
                  },
                  itemCount: newsList.length);
            })));
  }
}