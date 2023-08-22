import 'package:flutter/material.dart';

class InteractifPage extends StatefulWidget {
  @override
  // State<StatefulWidget> createState() {
  //   return InteractifPageState();
  // }

  InteractifPageState createState() => InteractifPageState();
}

class InteractifPageState extends State<InteractifPage> {
  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;
  bool textButtonPressed = false;
  IconData icon = Icons.favorite;
  String prenom = "";
  late TextEditingController controller;
  bool switchValue = true;
  double sliderValue = 50;
  bool check = false;
  Map<String, bool> courses = {
    "Carottes": false,
    "Oignon": true,
    "Abricot": true,
  };
  int groupValue = 1;

  DateTime initialDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Tout ce que l'on va faire pendant l'initialisation du widget
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
    //Tout ce que l'on va faire quand le widget sera dispose.
    //quand le widget sera supprime...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(updateAppBarText()),
      ),
      body: Center(
          child: Column(
        children: [
          TextButton(
              onPressed: updateAppBar,
              style: TextButton.styleFrom(foregroundColor: Colors.teal),
              child: Row(
                children: [const Icon(Icons.work), textButtonText()],
              )),
          ElevatedButton(
            onPressed: (() => showDate(context)),
            onLongPress: () {
              print("Appuie loooonnnngggg");
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                elevation: 10,
                shadowColor: Colors.red),
            child: Text("Date: ${initialDate}"),
          ),
          IconButton(
            onPressed: setIcon,
            icon: Icon(icon),
            color: Colors.pink,
            splashColor: Colors.pinkAccent,
          ),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
                hintText: "Entrez votre prenom",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                )),
            keyboardType: TextInputType.name,
            onSubmitted: (newString) {
              setState(() {
                prenom = newString;
              });
            },
          ),
          Text(prenom),
          TextField(
              controller: controller,
              decoration: InputDecoration(hintText: "Entrez votre nom"),
              onChanged: (newValue) {
                setState(() {});
              }),
          Text(controller.text),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text((switchValue)
                  ? "J'aime les chats"
                  : "Les chats sont demoniaques"),
              Switch(
                  activeColor: Colors.green,
                  inactiveTrackColor: Colors.red,
                  inactiveThumbColor: Colors.redAccent,
                  value: switchValue,
                  onChanged: ((bool) {
                    setState(() {
                      switchValue = bool;
                    });
                  }))
            ],
          ),
          Slider(
            value: sliderValue,
            min: 0,
            max: 100,
            onChanged: ((newValue) {
              setState(() {
                sliderValue = newValue;
              });
            }),
            thumbColor: Colors.blueAccent,
            inactiveColor: Colors.brown,
            activeColor: Colors.blue,
          ),
          Text("Valeur: ${sliderValue.toInt()}"),
          Checkbox(
              value: check,
              onChanged: ((newBool) =>
                  setState(() => check = newBool ?? false))),
          checks(),
          radios(),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: updateColors,
        child: const Icon(Icons.build),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  updateColors() {
    //code du voidCallback
    setState(() {
      backgroundColor =
          (backgroundColor == Colors.white) ? Colors.black : Colors.white;
      textColor =
          (backgroundColor == Colors.black) ? Colors.white : Colors.black;
    });
    //print("Tapped: $backgroundColor");
  }

  updateAppBar() {
    setState(() => textButtonPressed = !textButtonPressed);
  }

  String updateAppBarText() {
    return (textButtonPressed) ? "Je m'y connais un peu" : "Les interactifs";
  }

  Text textButtonText() {
    return const Text(
      "Je suis un TextButton",
      //style: TextStyle(color: Colors.pink, backgroundColor: Colors.grey),
    );
  }

  setIcon() {
    setState(() {
      icon = (icon == Icons.favorite) ? Icons.favorite_border : Icons.favorite;
    });
  }

  Column checks() {
    List<Widget> items = [];
    courses.forEach((course, acheter) {
      Widget row = Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(course),
          Checkbox(
            value: acheter,
            onChanged: ((newValue) {
              setState(() {
                courses[course] = newValue ?? false;
              });
            }),
            checkColor: Colors.greenAccent,
            activeColor: Colors.blueGrey,
          )
        ],
      );
      items.add(row);
    });

    return Column(children: items);
  }

  Row radios() {
    List<Widget> radios = [];
    for (var i = 0; i < 5; i++) {
      Radio r = Radio(
          value: i,
          groupValue: groupValue,
          onChanged: ((newValue) {
            setState(() {
              groupValue = newValue ?? 0;
            });
          }));

      radios.add(r);
    }

    return Row(children: radios);
  }

  showDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: DateTime(1978),
            lastDate: DateTime(2090))
        .then((value) => {
              if (value != null)
                {
                  setState(() {
                    initialDate = value;
                  })
                }
            });
  }
}
