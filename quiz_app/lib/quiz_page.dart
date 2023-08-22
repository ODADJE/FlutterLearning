import 'package:flutter/material.dart';
import 'package:quiz_app/datas.dart';

class QuizPage extends StatefulWidget {
  Color appBarColor;

  QuizPage({required this.appBarColor});

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  int score = 0;
  int questionNumber = 1;
  Datas theQuestions = Datas();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Score: $score"),
          backgroundColor: widget.appBarColor,
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200,
          ),
          alignment: Alignment.center,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Question numero $questionNumber/10",
                  style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.deepOrange),
                ),
                Text(
                  theQuestions.listeQuestions[questionNumber - 1].question,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Image.asset(
                    theQuestions.listeQuestions[questionNumber - 1].getImage()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (theQuestions
                                  .listeQuestions[questionNumber - 1].reponse ==
                              false) {
                            setState(() {
                              score++;
                            });
                            showMyDialog(
                                dialog: createSimple(
                                    resultat: true, image: "images/vrai.jpg"));
                            return;
                          }
                          showMyDialog(dialog: createSimple());
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red)),
                        child: const Text("Faux")),
                    ElevatedButton(
                        onPressed: () {
                          if (theQuestions
                                  .listeQuestions[questionNumber - 1].reponse ==
                              true) {
                            setState(() {
                              score++;
                            });
                            showMyDialog(
                                dialog: createSimple(
                                    resultat: true, image: "images/vrai.jpg"));
                            return;
                          }
                          showMyDialog(dialog: createSimple());
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green)),
                        child: const Text("Vrai"))
                  ],
                )
              ]),
        ));
  }

  Widget createSimple(
      {bool resultat = false, String image = "images/faux.jpg"}) {
    final simple = questionNumber < 10
        ? (SimpleDialog(
            elevation: 15,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  resultat ? "C'est gagne :) !!!" : "C'est Perdu :( !!!",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 17),
                ),
              ),
              Image.asset(image),
              !resultat
                  ? Text(
                      "Explication : ${theQuestions.listeQuestions[questionNumber - 1].explication}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 17),
                    )
                  : const Text(""),
              TextButton(
                  onPressed: () {
                    setState(() {
                      questionNumber++;
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Passer a la question suivante -->",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 17),
                  ))
            ],
          ))
        : AlertDialog(
            title: score >= 5
                ? const Text("C'est gagne")
                : const Text("C'est perdu"),
            content: Text("Score : $score"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK")),
            ],
          );

    return simple;
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
