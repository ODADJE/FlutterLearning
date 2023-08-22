import 'package:flutter/material.dart';
import 'package:marseille_project/datasource.dart';
import 'package:marseille_project/detail_page.dart';
import 'package:marseille_project/place.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Place> thePlaces = DataSource().allPlaces();

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Marseille",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: (orientation == Orientation.portrait) ? list() : grid());
  }

  Widget list() {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailPage(
                        place: thePlaces[index],
                      )));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text((index + 1).toString()),
                      Text(
                        "${thePlaces[index].name}",
                        style: TextStyle(color: Colors.blue),
                      ),
                      Image.asset(
                        thePlaces[index].getFolderPath(),
                        width: 150,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ]),
              ),
            ),
          );
        },
        itemCount: thePlaces.length);
  }

  Widget grid() {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailPage(
                        place: thePlaces[index],
                      )));
            },
            child: Card(
                child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Image.asset(
                        "${thePlaces[index].getFolderPath()}",
                        // width: 900,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text("${thePlaces[index].name}",
                        style: TextStyle(color: Colors.blue))
                  ]),
            )));
      },
      itemCount: thePlaces.length,
    );
  }
}
