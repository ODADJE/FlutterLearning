import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //useMaterial3: true,
          ),
      home: BasicsPage(),
    );
  }
}

class BasicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.red,
        title: const Text("Mon app basique"),
        leading: const Icon(Icons.favorite),
        actions: const [Icon(Icons.handyman_sharp)],
        centerTitle: true,
        elevation: 5.5,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(2),
          child: Card(
              elevation: 7.5,
              margin: const EdgeInsets.all(3),
              color: Colors.amber,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Test de la colonne"),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        fromAsset(height: 200, width: size.width),
                        Padding(
                          padding: const EdgeInsets.only(top: 160),
                          child: profilePicture(),
                        ),
                        const Row(
                          children: [Spacer(), Text("Un autre element")],
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.red,
                      height: 10,
                      thickness: 4,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 200,
                      width: size.width,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/beach.jpg"),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue,
                                offset: Offset(3, 3),
                                blurRadius: 2,
                                spreadRadius: 1)
                          ],
                          //shape: BoxShape.circle,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Text("Container"),
                    ),
                    Container(
                      color: Colors.teal,
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          profilePicture(),
                          //fromAsset(height: 80, width: 80),
                          Expanded(child: simpleText("Serge le codeur"))
                        ],
                      ),
                    ),
                    fromNetwork(),
                    spanDemo(),
                    fromNetwork(),
                  ],
                ),
              )),
        )),
      ),
    );
  }

  CircleAvatar profilePicture() {
    return const CircleAvatar(
      radius: 40,
      backgroundColor: Colors.tealAccent,
      foregroundImage: NetworkImage(
          "https://images.pexels.com/photos/2252311/pexels-photo-2252311.jpeg?auto=compress&cs=tinysrgb&w=1600"),
    );
  }

  Text simpleText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
      textAlign: TextAlign.center,
    );
  }

  Image fromAsset({double? height, double? width}) {
    return Image.asset(
      "images/beach.jpg",
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }

  Image fromNetwork() {
    return Image.network(
      "https://images.pexels.com/photos/2252311/pexels-photo-2252311.jpeg?auto=compress&cs=tinysrgb&w=1600",
      height: 200,
      // width: size.width,
      fit: BoxFit.cover,
    );
  }

  Text spanDemo() {
    return const Text.rich(TextSpan(
        text: "Salut",
        style: TextStyle(color: Colors.black),
        children: [
          TextSpan(
              text: "second style",
              style: TextStyle(fontSize: 30, color: Colors.lightBlue)),
          TextSpan(
              text: "Hello, la suite", style: TextStyle(color: Colors.purple))
        ]));
  }
}
