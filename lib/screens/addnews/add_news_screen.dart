import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio_news_app/models/add_news_model.dart';
import 'package:provider/provider.dart';

class AddNewsScreen extends StatelessWidget {
  String name = "";
  DateTime now = DateTime.now();
  DateFormat outputFormat = DateFormat('yyyy-MM-dd');

  AddNewsScreen(this.name);

  @override
  Widget build(BuildContext context) {
    String date = outputFormat.format(now);
    return ChangeNotifierProvider<AddNewsModel>(
      create: (_) => AddNewsModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text("ニュース追加"),
        ),
        body: SingleChildScrollView(
          //入力の時にスライドするように
          child: Center(
            child: Consumer<AddNewsModel>(builder: (context, model, child) {
              return Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "ニュースを追加してください",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "ニュース画像",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        GestureDetector(
                          child: SizedBox(
                            width: 200,
                            height: 112.5,
                            child: model.newsImageFile != null
                                ? Image.file(model.newsImageFile!)
                                : Container(
                                    color: Colors.grey,
                                  ),
                          ),
                          onTap: () async {
                            print("touched！");
                            await model.pickNewsImage();
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          focusNode: FocusNode(),
                          decoration: InputDecoration(
                            hintText: '記事タイトル',
                          ),
                          onChanged: (text) {
                            model.title = text;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          focusNode: FocusNode(),
                          decoration: InputDecoration(
                            hintText: '記事詳細',
                          ),
                          onChanged: (text) {
                            model.detail = text;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 130,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              model.name = this.name;
                              model.date = date;
                              // 追加の処理
                              try {
                                model.startLoading();
                                await model.addNews();
                                Navigator.of(context).pop(true);
                              } catch (e) {
                                print(e);
                                final snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(e.toString()),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } finally {
                                model.endLoading();
                              }
                            },
                            child: Text(
                              '追加',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  if (model.isLoading)
                    Container(
                      color: Colors.black54,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
