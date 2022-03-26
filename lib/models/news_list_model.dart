import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'news_model.dart';

class NewsListModel extends ChangeNotifier {
  List<NewsModel>? news;
  String? modelKind;
  NewsListModel(this.modelKind);

  void fetchProductList() async {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection(modelKind??"").orderBy('date', descending: true).get();

    final List<NewsModel> news = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String name = data['name'];
      final String detail=data['detail'];
      final String newsImage = data['newsImage'];
      final String date = data['date'];
      return NewsModel(id:id,name:name,title:title, detail:detail,newsImage: newsImage,date: date,);
    }).toList();

    this.news = news;
    notifyListeners();
  }
}