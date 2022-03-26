import 'package:flutter/material.dart';
import 'package:portfolio_news_app/models/company_list_model.dart';
import 'package:portfolio_news_app/models/company_model.dart';
import 'package:portfolio_news_app/screens/news/news_screen.dart';
import 'package:provider/provider.dart';



class TitleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
           Expanded(
            child: ChangeNotifierProvider<CompanyListModel>(
                create: (_) => CompanyListModel()..fetchProductList(),
                child:
                Consumer<CompanyListModel>(builder: (context, model, child) {
                  final List<CompanyModel>? companyList = model.company;
                  if (companyList == null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return NewsScreen(companyList[index].name);
                              }),
                            );
                          },
                          title: Text(companyList[index].name),);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          height: 2.0,
                        );
                      },
                      itemCount: companyList.length);
                })),
          ),
        ],
      ),
    );
  }
}
