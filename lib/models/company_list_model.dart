import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_news_app/models/company_model.dart';


class CompanyListModel extends ChangeNotifier {
  List<CompanyModel>? company;

  void fetchProductList() async {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection("company").get();

    final List<CompanyModel> company = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String name = data['name'];
      final String email=data['email'];
      return CompanyModel(id:id,name:name,email:email);
    }).toList();

    this.company = company;
    notifyListeners();
  }
}