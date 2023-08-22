import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        // useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Quizz Home page'),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Colors.pink.shade400,
            borderRadius: BorderRadius.circular(5),
            boxShadow: List.filled(1, const BoxShadow(blurRadius: 6))),
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(
              "images/cover.jpg",
              height: 200,
            ),
            ElevatedButton(
                onPressed: () {
                  //print("hello");
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext ctx) {
                    return QuizPage(appBarColor: Colors.deepOrangeAccent);
                  }));
                },
                child: const Text("Commencer le Quizz"))
          ],
        ),
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
