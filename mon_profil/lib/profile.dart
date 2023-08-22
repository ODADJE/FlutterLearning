class Profile {
  String surname;
  String name;
  int age;
  bool gender;
  double height;
  String secret;
  List<String> hobbies = [];
  String favoriteLang;

  Profile({
    this.surname = "",
    this.name = "",
    this.age = 0,
    this.gender = true,
    this.height = 0.0,
    this.secret = "",
    this.hobbies = const [],
    this.favoriteLang = "Dart",
  });

  String setName() => "$surname $name";
  String setAge() {
    String ageString = "$age an";
    if (age > 1) {
      ageString += "s";
    }
    return ageString;
  }

  String genderString() => (gender) ? "Feminin" : "Masculin";
  String setHeight() => "${height.toInt()} cm";
  String setHobbies() {
    String toHobbiesString = "";
    if (hobbies.isEmpty) {
      return toHobbiesString;
    } else {
      toHobbiesString = "Mes hobbies sont: ";
      for (var hobbie in hobbies) {
        toHobbiesString += " $hobbie,";
      }
      return toHobbiesString;
    }
  }
}
