import 'package:flutter/material.dart';

class AndroidPage extends StatefulWidget {
  @override
  AndroidPageState createState() => AndroidPageState();
}

class AndroidPageState extends State<AndroidPage> {
  bool loveFlutter = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notre design sous android")),
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                loveFlutter = !loveFlutter;
              });
            },
            child: Text(loveFlutter ? "I love flutter" : "php is my Favorite"))
      ]),
    );
  }
}
