import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'add_edit_list_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  String valueName = "";
  String valueMail = "";
  String valuePass = "";
  String infoText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("新規登録"),
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
                  icon: Icon(Icons.wysiwyg_sharp),
                  hintText: '会社名を入力してください',
                  labelText: '会社名',
                ),
                onChanged: (String? value) {
                  valueName = value.toString();
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
                  hintText: 'パスワード(6文字以上)',
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
                  // メール/パスワードでユーザー登録
                  final FirebaseAuth auth = FirebaseAuth.instance;
                  final UserCredential result =
                      await auth.createUserWithEmailAndPassword(
                    email: valueMail,
                    password: valuePass,
                  );

                  // 登録したユーザー情報
                  final User user = result.user!;
                  setState(() {
                    infoText = "登録OK：${user.email}";
                  });
                  final doc =
                      FirebaseFirestore.instance.collection('company').doc(valueMail);
                  await doc.set({
                    'name': valueName,
                    'email':valueMail
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return AddEditListScreen(this.valueName);
                    }),
                  );
                } catch (e) {
                  // 登録に失敗した場合
                  setState(() {
                    infoText = "登録NG：${e.toString()}";
                  });
                }
              },
              child: Text("新規登録"),
            ),
            const SizedBox(height: 8),
            Text(infoText),
          ],
        ),
      ),
    );
  }
}
