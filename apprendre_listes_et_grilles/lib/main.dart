import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        // useMaterial3: true,
        //primarySwatch: Colors.red
      ),
      home: const MyHomePage(title: "Listes et Grilles"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  initState() {
    super.initState();
    maListeDeCourse = listeDeCourses();
  }

  List<String> courses = [
    "Carottes",
    "Tomates",
    "Cerises",
    "Mangues",
    "Produit vaisselle",
    "Soda",
    "Nutella",
    "Viande",
    "Poisson",
    "Papier toilette",
    "Liquide lave linge",
    "Chlore",
    "Sauce salade",
    "Huile d'olive",
    "Dentifrice",
    "brosse a dents",
    "Pain"
  ];
  List<Course> maListeDeCourse = [];
  List<Course> listeDeCourses() {
    List<Course> c = [];
    courses.forEach((element) {
      c.add(Course(element));
    });
    return c;
  }

  List<Widget> itemCourses() {
    List<Widget> items = [];

    for (var element in courses) {
      final widget = elementToShow(element);
      items.add(widget);
    }

    return items;
  }

  Widget elementToShow(String element) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [Text(element), const Icon(Icons.check_box_outline_blank)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    print(orientation);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: orientation == Orientation.portrait ? listSepareted() : grid()

        /**/

        );
  }

  Widget listSepareted() {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(maListeDeCourse[index].element),
            child: tile(index),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                maListeDeCourse.removeAt((index));
              });
            },
            background: Container(
              padding: EdgeInsets.only(right: 8),
              color: Colors.redAccent,
              child: const Row(
                mainAxisSize: MainAxisSize.max,
                children: [Spacer(), Text("Swipe pour supprimer")],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.indigoAccent,
            thickness: 1,
          );
        },
        itemCount: maListeDeCourse.length);
  }

  Widget simpleList() {
    return ListView.builder(
        itemCount: courses.length,
        itemBuilder: (BuildContext context, int index) {
          final element = courses[index];
          return elementToShow(element);
        });
  }

  Widget grid() {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Card(
            color: (maListeDeCourse[index].bought ? Colors.green : Colors.red),
            child: Center(child: Text(maListeDeCourse[index].element)),
          ),
          onTap: () {
            setState(() {
              maListeDeCourse[index].update();
            });
          },
        );
      },
      itemCount: maListeDeCourse.length,
    );
  }

  ListTile tile(int index) {
    return ListTile(
        title: Text(maListeDeCourse[index].element),
        leading: Text(index.toString()),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              maListeDeCourse[index].update();
            });
          },
          icon: Icon((maListeDeCourse[index].bought)
              ? Icons.check_box
              : Icons.check_box_outline_blank),
        ),
        onTap: () {});
  }
}

class Course {
  String element;
  bool bought = false;

  Course(this.element);

  update() {
    bought = !bought;
  }
}
