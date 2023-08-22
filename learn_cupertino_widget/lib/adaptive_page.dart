import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptivePage extends StatefulWidget {
  final TargetPlatform platform;

  AdaptivePage({required this.platform});

  @override
  AdaptivePageState createState() => AdaptivePageState();
}

class AdaptivePageState extends State<AdaptivePage> {
  bool loveFlutter = true;
  bool switchValue = true;
  double minValue = 0;
  double maxValue = 100;
  double currentValue = 25;
  String text = "";

  @override
  Widget build(BuildContext context) {
    return scaffold();
  }

  bool isIos() => (widget.platform != TargetPlatform.iOS);

  Widget scaffold() {
    return (isIos())
        ? CupertinoPageScaffold(navigationBar: navBar(), child: body())
        : Scaffold(
            appBar: appBar(),
            body: body(),
          );
  }

  AppBar appBar() {
    return AppBar(title: const Text("Notre design sous Android"));
  }

  CupertinoNavigationBar navBar() {
    return const CupertinoNavigationBar(
      middle: Text("Notre design sous iOS"),
      backgroundColor: Colors.red,
    );
  }

  Widget body() {
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.only(
          top: 8,
        )),
        button(),
        const Divider(),
        switchRow(),
        const Divider(),
        sliderColumn(),
        const Divider(),
        textFields(),
        Text(text),
        const Divider(),
        fab()
      ],
    );
  }

  Widget button() {
    return isIos()
        ? CupertinoButton(
            onPressed: onButtonPressed,
            color: Colors.red,
            child: textButton(),
          )
        : ElevatedButton(onPressed: onButtonPressed, child: textButton());
  }

  Text textButton() {
    return Text(loveFlutter ? "I love flutter" : "php is my favorite");
  }

  void onButtonPressed() {
    setState(() {
      loveFlutter = !loveFlutter;
    });
  }

  Row switchRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(switchValue ? "Je suis vrai" : "Je suis faux"),
          switchAdaptive()
        ],
      );

  Widget switchAdaptive() {
    return (isIos())
        ? CupertinoSwitch(value: switchValue, onChanged: onSwitchChanged)
        : Switch(value: switchValue, onChanged: onSwitchChanged);
  }

  void onSwitchChanged(bool newValue) => setState(() => switchValue = newValue);

  Widget slider() {
    return isIos()
        ? CupertinoSlider(
            value: currentValue,
            min: minValue,
            max: maxValue,
            onChanged: onsliderChanged)
        : Slider(
            value: currentValue,
            min: minValue,
            max: maxValue,
            onChanged: onsliderChanged);
  }

  onsliderChanged(double newValue) {
    setState(() {
      currentValue = newValue;
    });
  }

  Column sliderColumn() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Min: ${minValue.toInt().toString()}"),
            Text("Max: ${maxValue.toInt().toString()}")
          ],
        ),
        slider(),
        Text(currentValue.toInt().toString())
      ],
    );
  }

  Widget textFields() {
    return (isIos())
        ? CupertinoTextField(
            onSubmitted: submittedText,
            placeholder: "Entrez quelque chose",
          )
        : TextField(
            onSubmitted: submittedText,
            decoration: const InputDecoration(hintText: "Entrez quelque chose"),
          );
  }

  submittedText(String newValue) {
    setState(() {
      text = newValue;
    });
  }

  Widget actionSheet() {
    return const CupertinoActionSheet(
      title: Text("Notre ActionSheet"),
      message: Text("Notre message"),
      // actions: [
      //   CupertinoDialogAction(child: Text("Oui")),
      //   CupertinoDialogAction(child: Text("Non")),
      //   CupertinoDialogAction(child: Text("Peut-etre"))
      // ],
    );
  }

  FloatingActionButton fab() {
    return FloatingActionButton(
      onPressed: () {
        // if (isIos()) {
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return actionSheet();
            });
        //}
      },
      child: const Icon(Icons.apartment),
    );
  }
}
