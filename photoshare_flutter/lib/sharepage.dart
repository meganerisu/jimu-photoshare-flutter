import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

import 'tree.dart';

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
          // itemCount: listItem.length,
          itemCount: photoShare.children.length,
          itemBuilder: (BuildContext context, int index) {
            //expansionList wo tsukau
            return Container(
              child: Card(
                child: ListTile(
                  title: Text(photoShare.children[index].name),
                  onTap: () {
                    Navigator.of(context).pushNamed('/photoShareSecoundary',
                        arguments: Category(photoShare.children[index].name,
                            photoShare.children[index].children));
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
    final Category topCategory = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(topCategory.name),
      ),
      body: ListView.builder(
          itemCount: topCategory.children.length,
          itemBuilder: (BuildContext context, int index) {
            //expansionList wo tsukau
            return Container(
              child: Card(
                child: ListTile(
                  title: Text(topCategory.children[index].name),
                  onTap: () {
                    Navigator.of(context).pushNamed('/Album',
                        arguments: Category(topCategory.children[index].name,
                            topCategory.children[index].children));
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
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Category subCategory = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(subCategory.name),
      ),
      body: ListView.builder(
          itemCount: subCategory.children.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Card(
                child: ListTile(
                  title: Text(subCategory.children[index].name),
                  subtitle: Text(subCategory.children[index].url.toString()),
                  onTap: () {
                    _launchURL(subCategory.children[index].url.toString());
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
