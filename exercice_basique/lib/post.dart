class Post {
  String name;
  String time;
  String _imagePath = "";
  String desc;
  int likes;
  int comments;

  Post({
    required this.name,
    required this.time,
    String imagePath = "",
    required this.desc,
    required this.likes,
    required this.comments,
  }) {
    _imagePath = imagePath;
  }

  String setTime() => "Il y a $time";
  String setLikes() {
    return "$likes j'aime";
  }

  String setComments() {
    if (comments > 1) {
      return "$comments commentaires";
    } else {
      return "$comments commentaire";
    }
  }

  String get imagePath {
    return _imagePath;
  }

  set image(String newUrl) {
    if (newUrl != "") {
      _imagePath = newUrl;
    }
  }
}
