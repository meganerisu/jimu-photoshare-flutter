import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
var listItem = [
  "one",
  "two",
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine",
  "ten",
  "eleven",
  "tewlve"
];

class PhotoShareTopPage extends StatefulWidget {
  const PhotoShareTopPage() : super();

  @override
  _PhotoShareTopPage createState() => _PhotoShareTopPage();
}

class _PhotoShareTopPage extends State<PhotoShareTopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("jim-photoshare"),
      ),
      body: ListView.builder(
          itemCount: listItem.length,
          itemBuilder: (BuildContext context, int index) {
            //expansionList wo tsukau
            return Container(
              child: Card(
                child: ListTile(
                  title: Text(listItem[index]),
                  onTap: () {},
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _auth.signOut();
          Navigator.of(context).pushReplacementNamed("/");
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
