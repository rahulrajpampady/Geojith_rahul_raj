class Home {
  int? userId;
  int? id;
  String? title;
  String? body;

  Home({this.userId, this.id, this.title, this.body});

  Home.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title']??'';
    body = json['body'];
  }

  static List<Home> convertToList(List<dynamic> list) {
    if (list == null) return [];

    List<Home> data = [];
    list.forEach((element) {
      data.add(Home.fromJson(element));
    });

    return data;
  }
}