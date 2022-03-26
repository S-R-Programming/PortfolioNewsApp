import 'package:flutter/material.dart';
import 'package:portfolio_news_app/models/edit_news_model.dart';
import 'package:portfolio_news_app/models/news_model.dart';
import 'package:provider/provider.dart';

class EditNewsScreen extends StatelessWidget {
  final NewsModel newsModel;
  EditNewsScreen(this.newsModel);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditNewsModel>(
      create: (_) => EditNewsModel(newsModel),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text("ニュース編集"),
        ),
        body: Center(
          child: Consumer<EditNewsModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: model.titleController,
                    decoration: InputDecoration(
                      hintText: '記事タイトル',
                    ),
                    onChanged: (text) {
                      model.setTitle(text);
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: model.detailController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: '記事の内容',
                    ),
                    onChanged: (text) {
                      model.setDetail(text);
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: model.isUpdated()
                        ? () async {
                      // 追加の処理
                      try {
                        await model.update();
                        Navigator.of(context).pop(model.title);
                      } catch (e) {
                        final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(e.toString()),
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar);
                      }
                    }
                        : null,
                    child: Text('変更'),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}