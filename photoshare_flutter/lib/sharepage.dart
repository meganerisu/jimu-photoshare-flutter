import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
var listItem = ["one", "two", "three", "four", "five", "six", "seven", "eight"];

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("jim-photoshare"),
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black38)),
          ),
          child: ListTile(
            title: Text("$index"),
          ),
        );
      }),
      // body: Center(
      //   child: Text('Welcome!', style: Theme.of(context).textTheme.headline2),
      // ),
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
