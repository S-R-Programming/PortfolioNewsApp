import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_news_app/models/news_model.dart';

class EditNewsModel extends ChangeNotifier {
  final NewsModel newsModel;
  EditNewsModel(this.newsModel) {
    titleController.text = newsModel.title;
    detailController.text = newsModel.detail;
  }

  final titleController = TextEditingController();
  final detailController = TextEditingController();

  String? title;
  String? detail;

  void setTitle(String title) {
    this.title = title;
    notifyListeners();
  }

  void setDetail(String detail) {
    this.detail = detail;
    notifyListeners();
  }

  bool isUpdated() {
    return title != null || detail != null;
  }

  Future update() async {
    this.title = titleController.text;
    this.detail = detailController.text;

    // firestoreに追加
    await FirebaseFirestore.instance.collection('news').doc(newsModel.id).update({
      'title': title,
      'detail': detail,
    });
    await FirebaseFirestore.instance.collection(newsModel.name).doc(newsModel.id).update({
      'title': title,
      'detail': detail,
    });
  }
}