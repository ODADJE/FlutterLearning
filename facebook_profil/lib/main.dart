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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        //useMaterial3: true,
      ),
      home: FacebookProfil(),
    );
  }
}

class FacebookProfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Basics"),
        ),
        body: SingleChildScrollView(
          child: Container(
              color: Colors.white,
              width: size.width,
              //height: size.height,
              child: Column(
                children: [
                  const Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image(
                        height: 200,
                        width: double.infinity,
                        image: NetworkImage(
                            'https://images.pexels.com/photos/62389/pexels-photo-62389.jpeg?auto=compress&cs=tinysrgb&w=1600'),
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 150),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: CircleAvatar(
                            radius: 47,
                            backgroundImage: NetworkImage(
                                "https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=1600"),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Text(
                    "Lorem Ipsum",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 7, left: 10, right: 10),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: 40,
                        width: 300,
                        child: const Text(
                          "Modifier le profil",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        height: 40,
                        width: 50,
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      width: size.width,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 20, left: 15, bottom: 5),
                        child: Text(
                          "A propos de moi",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.home),
                            Text("Dakar, Senegal",
                                style: TextStyle(fontSize: 16))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.shopping_bag_rounded),
                            Text("Developpeur cross-plateform",
                                style: TextStyle(fontSize: 16))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.favorite),
                            Text("En couple", style: TextStyle(fontSize: 16))
                          ],
                        )
                      ],
                    ),
                  ),

                  //Ici
                  Container(
                      width: size.width,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 20, left: 15, bottom: 5),
                        child: Text(
                          "Amis",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Image(
                              image: NetworkImage(
                                  "https://images.pexels.com/photos/1413051/pexels-photo-1413051.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"),
                              height: 140,
                              width: 100,
                            ),
                            Text("Antoine", style: TextStyle(fontSize: 14))
                          ],
                        ),
                        Column(
                          children: [
                            Image(
                              image: NetworkImage(
                                  "https://images.pexels.com/photos/4890733/pexels-photo-4890733.jpeg?auto=compress&cs=tinysrgb&w=600"),
                              width: 100,
                              height: 140,
                            ),
                            Text("Kevin", style: TextStyle(fontSize: 14))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: NetworkImage(
                                  "https://images.pexels.com/photos/4636339/pexels-photo-4636339.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"),
                              width: 100,
                              height: 140,
                            ),
                            Text("Celestine", style: TextStyle(fontSize: 14))
                          ],
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(7),
                    padding: EdgeInsets.all(10),
                    width: size.width,
                    height: 380,
                    color: Colors.grey.shade300,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      "https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=1600"),
                                ),
                              ),
                              Text(
                                "Lorem Ipsum",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              )
                            ]),
                            Text("Il y'a 5 heures")
                          ],
                        ),
                        Image(
                            width: double.infinity,
                            image: NetworkImage(
                                "https://images.pexels.com/photos/70080/elephant-africa-african-elephant-kenya-70080.jpeg?auto=compress&cs=tinysrgb&w=600")),
                        Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ."),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                Text("36 likes")
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.message,
                                  color: Colors.blue,
                                ),
                                Text("12 commentaires")
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(7),
                    padding: EdgeInsets.all(10),
                    width: size.width,
                    height: 380,
                    color: Colors.grey.shade300,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      "https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=1600"),
                                ),
                              ),
                              Text(
                                "Lorem Ipsum",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              )
                            ]),
                            Text("Il y'a 5 heures")
                          ],
                        ),
                        Image(
                            width: double.infinity,
                            image: NetworkImage(
                                "https://images.pexels.com/photos/70080/elephant-africa-african-elephant-kenya-70080.jpeg?auto=compress&cs=tinysrgb&w=600")),
                        Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ."),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                Text("36 likes")
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.message,
                                  color: Colors.blue,
                                ),
                                Text("12 commentaires")
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(7),
                    padding: EdgeInsets.all(10),
                    width: size.width,
                    height: 380,
                    color: Colors.grey.shade300,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      "https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=1600"),
                                ),
                              ),
                              Text(
                                "Lorem Ipsum",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              )
                            ]),
                            Text("Il y'a 5 heures")
                          ],
                        ),
                        Image(
                            width: double.infinity,
                            image: NetworkImage(
                                "https://images.pexels.com/photos/70080/elephant-africa-african-elephant-kenya-70080.jpeg?auto=compress&cs=tinysrgb&w=600")),
                        Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ."),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                Text("36 likes")
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.message,
                                  color: Colors.blue,
                                ),
                                Text("12 commentaires")
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
