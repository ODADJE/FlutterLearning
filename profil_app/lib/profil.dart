import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profil extends StatefulWidget {
  @override
  ProfilState createState() => ProfilState();
}

class ProfilState extends State<Profil> {
  bool showSecret = false;
  String name = "Nom";
  String firstname = "Prenom";
  int age = 0;
  double taille = 0;
  bool setGenre = false;
  int groupValue = 0;
  Map<String, bool> hobbies = {
    "Musique": false,
    "Natation": false,
    "Lecture": false,
    "Dormir": false,
    "Voir la famille": false,
  };
  List<String> languagesList = ["Dart", "Swift", "Kotlin", "Java", "Python"];
  String secretMessage = "Je suis le secret";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mon Profil"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.purpleAccent.shade100,
                ),
                child: Center(
                  child: Column(
                    children: [
                      myTest(text: "$firstname $name"),
                      //myTest(text: "Age", valeur: age),
                      myTest(text: "Taille", valeur: "${taille.toInt()} cm"),
                      myTest(
                          text: "Genre",
                          valeur: setGenre ? "Masculin" : "Feminin"),
                      myTest(text: "Hobbies", valeur: HobbiesString(hobbies)),
                      myTest(
                          text: "Langage de programmation favori",
                          valeur: languagesList[groupValue]),
                      ElevatedButton(
                          onPressed: (() {
                            setState(() {
                              showSecret = !showSecret;
                            });
                          }),
                          child: Text(
                            (showSecret
                                ? "Cacher le secret"
                                : "Montrer le secret"),
                          )),
                      showSecret
                          ? myTest(text: secretMessage)
                          : myTest(text: ""),
                    ],
                  ),
                )),
            const Divider(
              thickness: 3,
              color: Colors.deepPurple,
            ),
            sectionTitle(text: "Modifier les infos"),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(children: [
                myfield(hint: "Nom", type: "nom"),
                myfield(hint: "Prenom", type: "prenom"),
                myfield(
                    hint: "Dites nous un secret",
                    hideSecret: true,
                    type: "secret"),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myTest(
                        text: "Genre",
                        valeur: setGenre ? "Masculin" : "Feminin"),
                    Switch(
                        value: setGenre,
                        activeColor: Colors.deepPurple,
                        onChanged: ((bool myBool) {
                          setState(() {
                            setGenre = myBool;
                          });
                        }))
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myTest(text: "Taille", valeur: "${taille.toInt()} cm"),
                    Slider(
                        value: taille,
                        min: 0,
                        max: 250,
                        onChanged: ((newValue) {
                          setState(() {
                            taille = newValue;
                          });
                        }))
                  ],
                ),
              ]),
            ),
            const Divider(
              thickness: 3,
              color: Colors.deepPurple,
            ),
            sectionTitle(text: "Mes Hobbies"),
            Padding(
              padding: const EdgeInsets.all(10),
              child: hobbiesCheck(),
            ),
            const Divider(
              thickness: 3,
              color: Colors.deepPurple,
            ),
            sectionTitle(text: "Langage prefere"),
            Padding(
              padding: const EdgeInsets.all(10),
              child: languagePreviewSelection(),
            ),
          ]),
        ));
  }

  Text myTest({required String text, dynamic valeur}) {
    return Text(
      (valeur != null ? "$text: $valeur" : text),
      style: const TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
    );
  }

  Text sectionTitle({required String text}) {
    return Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.bold, color: Colors.deepPurple, fontSize: 20),
    );
  }

  TextField myfield(
      {required String hint, bool hideSecret = false, required String type}) {
    return TextField(
      decoration: InputDecoration(hintText: hint),
      obscureText: hideSecret,
      onChanged: ((newValue) {
        setState(() {
          //name = newValue;
          switch (type) {
            case "nom":
              name = newValue;
              break;
            case "prenom":
              firstname = newValue;
              break;
            case "secret":
              secretMessage = newValue;
              break;
          }
        });
      }),
    );
  }

  Column hobbiesCheck() {
    List<Widget> myHobbies = [];

    hobbies.forEach((hobbie, value) {
      myHobbies.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(hobbie),
          Checkbox(
              activeColor: Colors.deepPurple,
              value: value,
              onChanged: ((newValue) {
                setState(() {
                  hobbies[hobbie] = newValue ?? false;
                });
              }))
        ],
      ));
    });

    return Column(
      children: myHobbies,
    );
  }

  Column languagePreviewSelection() {
    List<Text> languages = [];
    List<Radio> languagesRadio = [];

    for (var i = 0; i < languagesList.length; i++) {
      languages.add(Text(languagesList[i]));
      languagesRadio.add(Radio(
          value: i,
          groupValue: groupValue,
          onChanged: ((newValue) {
            setState(() {
              groupValue = newValue;
            });
          })));
    }

    Row languagesRow = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: languages);

    Row languagesCheckRow = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: languagesRadio);

    return Column(
      children: [languagesRow, languagesCheckRow],
    );
  }

  String HobbiesString(Map hobbies) {
    List<String> loveHobbies = [];
    hobbies.forEach((key, value) {
      if (value) {
        loveHobbies.add(key);
      }
    });
    String stringloveHobbies = loveHobbies.toString().replaceFirst("[", "");
    stringloveHobbies = stringloveHobbies.replaceFirst("]", "");

    return "$stringloveHobbies.";
  }
}
