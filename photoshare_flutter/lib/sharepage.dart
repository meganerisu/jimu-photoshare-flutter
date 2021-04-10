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
var listItem2 = [
  "one2",
  "two2",
  "three2",
  "four2",
  "five2",
  "six2",
  "seven2",
  "eight2",
  "nine2",
  "ten2",
  "eleven2",
  "tewlve2"
];
var listItem3 = [
  "one3",
  "two3",
  "three3",
  "four3",
  "five3",
  "six3",
  "seven3",
  "eight3",
  "nine3",
  "ten3",
  "eleven3",
  "tewlve3"
];

class PhotoShareTopPage extends StatelessWidget {
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
                  onTap: () {
                    Navigator.of(context).pushNamed('/photoShareSecoundary',
                        arguments: listItem[index].toString());
                  },
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

class PhotoShareSecoundaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String topCategoryName = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(topCategoryName),
      ),
      body: ListView.builder(
          itemCount: listItem2.length,
          itemBuilder: (BuildContext context, int index) {
            //expansionList wo tsukau
            return Container(
              child: Card(
                child: ListTile(
                  title: Text(listItem2[index]),
                  onTap: () {
                    Navigator.of(context).pushNamed('/Album',
                        arguments: listItem2[index].toString());
                  },
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

class AlbumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String albumName = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(albumName),
      ),
      body: ListView.builder(
          itemCount: listItem3.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Card(
                child: ListTile(
                  title: Text(listItem3[index]),
                  subtitle: Text("subtitle"),
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
