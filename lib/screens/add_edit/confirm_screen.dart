import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_news_app/screens/add_edit/create_account_screen.dart';

import 'add_edit_list_screen.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  String valueMail = "";
  String valuePass = "";
  String valueName = "";
  String infoText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("ログイン"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  icon: Icon(Icons.person),
                  hintText: 'メールアドレスを入力してください',
                  labelText: 'メールアドレス',
                ),
                onChanged: (String? value) {
                  valueMail = value.toString();
                  print(value.toString());
                }),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  icon: Icon(Icons.person),
                  hintText: 'パスワードを入力してください',
                  labelText: 'パスワード',
                ),
                onChanged: (String? value) {
                  valuePass = value.toString();
                  print(value.toString());
                }),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  // メール/パスワードでログイン
                  final FirebaseAuth auth = FirebaseAuth.instance;
                  final UserCredential result =
                      await auth.signInWithEmailAndPassword(
                    email: valueMail,
                    password: valuePass,
                  );
                  // ログインに成功した場合
                  final User user = result.user!;
                  setState(() {
                    infoText = "ログインOK：${user.email}";
                  });
                  //emailで会社名を検索
                  await FirebaseFirestore.instance
                      .collection('company')
                      .doc(valueMail)
                      .get()
                      .then((value) {
                    setState(() {
                      valueName=value.get("name");
                    });
                  });
                  print("value=$valueName");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return AddEditListScreen(this.valueName);
                    }),
                  );
                } catch (e) {
                  // ログインに失敗した場合
                  setState(() {
                    infoText = "ログインNG：${e.toString()}";
                  });
                }
              },
              child: Text("ログイン"),
            ),
            const SizedBox(height: 8),
            Text(infoText),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CreateAccountScreen();
                    }),
                  );
                },
                child: Text(
                  "新規登録はこちら",
                  style: TextStyle(
                      fontSize: 15, decoration: TextDecoration.underline),
                ))
          ],
        ),
      ),
    );
  }
}
