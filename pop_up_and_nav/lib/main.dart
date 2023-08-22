import 'package:flutter/material.dart';

import 'next.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pop Up et Nav'),
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
  Color btnColor = Colors.greenAccent;
  Color appBarColor = Colors.lightBlueAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: (() {
                  showMyDialog(dialog: createAlert());
                }),
                child: Text("Montrer une alerte")),
            ElevatedButton(
                onPressed: () {
                  showMyDialog(dialog: createSimple());
                },
                child: const Text("Montrer simple")),
            ElevatedButton(
                onPressed: () {
                  final nextPage = Next(color: appBarColor);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext ctx) {
                    return nextPage;
                  }));
                },
                child: Text("Passer a la page suivante"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          ScaffoldMessenger.of(context)
              .showSnackBar(createSnack(text: "Snackbar evoluee"));
        }),
        tooltip: 'Increment',
        backgroundColor: btnColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  SnackBar createSnack({required String text}) {
    final content = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [const Icon(Icons.house), Text(text)],
    );

    final snack = SnackBar(
      content: content,
      action: SnackBarAction(
        label: "changer couleur",
        onPressed: () {
          setState(() {
            btnColor = (btnColor == Colors.greenAccent)
                ? Colors.redAccent
                : Colors.greenAccent;
          });
        },
        textColor: Colors.red,
      ),
      backgroundColor: Colors.greenAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 8,
      behavior: SnackBarBehavior.floating,
    );

    return snack;
  }

  SimpleDialog createSimple() {
    final simple = SimpleDialog(
      title: const Text("Je suis un simple dialogue"),
      elevation: 15,
      children: [
        const Text("Je suis comme une colonne"),
        const Divider(),
        const Text("Mais je suis dans un pop up"),
        option()
      ],
    );

    return simple;
  }

  SimpleDialogOption option() {
    return SimpleDialogOption(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text("OK"),
    );
  }

  AlertDialog createAlert() {
    return AlertDialog(
      title: const Text("Ma premiere alerte"),
      content: const Text("J'ai cree ma premiere alerte"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                appBarColor = appBarColor == Colors.lightBlueAccent
                    ? Colors.lightGreenAccent
                    : Colors.lightBlueAccent;
              });
            },
            child: const Text("Changer le AppBar"))
      ],
    );
  }

  Future<void> showMyDialog({required Widget dialog}) async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return dialog;
        });
  }
}
