import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewsModel extends ChangeNotifier {
  String? title;
  String? detail;
  File? newsImageFile;
  bool isLoading = false;
  String? date;
  String? name;

  final picker = ImagePicker();

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future addNews() async {
    if (title == null || title == "") {
      throw '記事のタイトルを入力してください';
    }

    if (detail == null || detail!.isEmpty) {
      throw '記事の詳細を入力してください';
    }

    final doc = FirebaseFirestore.instance.collection('news').doc();
    final doc_kind = FirebaseFirestore.instance.collection(name ?? "").doc(doc.id);

    String? newsImgURL;
    if (newsImageFile != null) {
      // storageにアップロード
      final task = await FirebaseStorage.instance
          .ref('news/${doc.id}')
          .putFile(newsImageFile!);
      newsImgURL = await task.ref.getDownloadURL();
    }

    // 全体ニュースに追加
    await doc.set({
      'title': title,
      'name':name,
      'detail': detail,
      'newsImage': newsImgURL,
      'date': date,
    });

    //ゲーム別ニュースに追加
    await doc_kind.set({
      'title': title,
      'name':name,
      'detail': detail,
      'newsImage': newsImgURL,
      'date': date,
    });
  }

  Future pickNewsImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      newsImageFile = File(pickedFile.path);
      notifyListeners();
    }
  }
}
