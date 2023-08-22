import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosPage extends StatefulWidget {
  @override
  IosPageState createState() => IosPageState();
}

class IosPageState extends State<IosPage> {
  bool loveIt = true;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text("Design sous Ios"),
          leading: Icon(Icons.source),
          backgroundColor: Colors.red,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.max,
          children: [
            CupertinoButton(
                color: Colors.lightBlueAccent,
                child: Text(loveIt ? "I love flutter" : "php is my favorite"),
                onPressed: () {
                  setState(() {
                    loveIt = !loveIt;
                  });
                })
          ],
        ));
  }
}
