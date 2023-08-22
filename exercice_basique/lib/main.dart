import 'package:exercice_basique/main_title_text.dart';
import 'package:exercice_basique/section_title.dart';
import 'package:flutter/material.dart';
import 'package:exercice_basique/post.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        //useMaterial3: true,
      ),
      home: BasicPage(),
    );
  }
}

class BasicPage extends StatelessWidget {
  List<Post> posts = [
    Post(
        name: "Serge Odadje",
        likes: 200,
        comments: 900,
        time: "5 minutes",
        imagePath: "images/carnaval.jpg",
        desc: "Petit tour a magic World, On s'est bien amuses!"),
    Post(
        name: "Serge Odadje",
        time: "2 jours",
        imagePath: "images/mountain.jpg",
        desc:
            "Petit tour en montagne. Vous devriez essayer d'y faire un petit tour egalement. La decouverte de la nature m'a fait tant de bien.",
        likes: 38,
        comments: 10),
    Post(
        name: "Serge Odadje",
        comments: 30,
        time: "1 semaine",
        imagePath: "images/work.jpg",
        desc: "Retour au travail!",
        likes: 12),
    Post(
        name: "Serge Odadje",
        likes: 10,
        comments: 12,
        time: "5 ans",
        imagePath: "images/playa.jpg",
        desc: "La plage c'est super cool!")
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Facebook Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  "images/cover.jpg",
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 125),
                    child: CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.white,
                      child: myProfilePic(72),
                    )),
              ],
            ),
            Row(
              children: [
                const Spacer(),
                MainTitleText(data: "Serge ODADJE"),
                const Spacer()
              ],
            ),
            const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Un jour les chats domineront le monde, mais pas aujourd'hui, c'est l'heure de la sieste",
                  style: TextStyle(
                      color: Colors.grey, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                )),
            Row(
              children: [
                Expanded(child: buttonContainer(text: "Modifier le profil")),
                buttonContainer(icon: Icons.border_color)
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            SectionTitle("A propos de moi"),
            aboutRow(icon: Icons.house, text: "Dakar, Senegal"),
            aboutRow(icon: Icons.work, text: "Developpeur Flutter"),
            aboutRow(icon: Icons.favorite, text: "En couple avec Dahina"),
            const Divider(
              thickness: 2,
            ),
            SectionTitle("Amis"),
            allFriends(width / 3.5),
            const Divider(
              thickness: 2,
            ),
            SectionTitle("Mes posts"),
            allPosts(),
          ],
        ),
      ),
    );
  }

// Functions
  CircleAvatar myProfilePic(double radius) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: const AssetImage("images/profile.jpg"),
    );
  }

  Container buttonContainer({IconData? icon, String? text}) {
    return Container(
        height: 50,
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        child: (icon == null)
            ? Center(
                child: Text(text ?? "",
                    style: const TextStyle(color: Colors.white)),
              )
            : Icon(icon, color: Colors.white));
  }

  Widget aboutRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(text),
        )
      ],
    );
  }

  Column friendsImage(String name, String imagePath, double width) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          width: width,
          height: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [BoxShadow(color: Colors.grey)],
              color: Colors.blue),
        ),
        Text(name),
        const Padding(padding: EdgeInsets.only(bottom: 5))
      ],
    );
  }

  Row allFriends(double width) {
    Map<String, String> friends = {
      "Anthony": "images/cat.jpg",
      "Maggie": "images/sunflower.jpg",
      "Stephane": "images/duck.jpg",
      //"Guillaume": "images/duck.jpg"
    };

    List<Widget> children = [];

    friends.forEach((name, imagePath) {
      children.add(friendsImage(name, imagePath, width));
    });
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  Column allPosts() {
    List<Widget> postToAdd = [];
    for (var element in posts) {
      postToAdd.add(post(post: element));
    }

    return Column(children: postToAdd);
  }

  Container post({required Post post}) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 3, right: 3),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(225, 255, 255, 1),
      ),
      child: Column(children: [
        Row(
          children: [
            myProfilePic(20),
            const Padding(
              padding: EdgeInsets.only(left: 8),
            ),
            Text(post.name),
            const Spacer(),
            timeText(post.setTime())
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Image.asset(
            post.imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          post.desc,
          style: const TextStyle(color: Colors.blueAccent),
          textAlign: TextAlign.center,
        ),
        const Divider(),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.favorite),
            Text(post.setLikes()),
            const Icon(Icons.message),
            Text(post.setComments())
          ],
        )
      ]),
    );
  }

  Text timeText(String time) {
    return Text(
      "Il y a $time",
      style: const TextStyle(color: Colors.blue),
    );
  }
}
