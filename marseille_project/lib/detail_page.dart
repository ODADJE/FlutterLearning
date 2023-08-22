import 'package:flutter/material.dart';
import 'package:marseille_project/place.dart';

class DetailPage extends StatefulWidget {
  Place place;
  DetailPage({required this.place});

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place.name,
            style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Container(
              padding: const EdgeInsets.all(10),
              child: (orientation == Orientation.portrait)
                  ? portraitView()
                  : Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                          Expanded(
                              child: Image.asset(widget.place.getFolderPath())),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 9),
                              child: Text(widget.place.desc),
                            ),
                          )
                        ]))),
    );
  }

  Widget portraitView() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Image.asset(widget.place.getFolderPath())),
        Expanded(child: Text(widget.place.desc))
      ],
    );
  }
}
