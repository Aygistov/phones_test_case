class Exhibit {
  String title;
  final List<String> images;
  Exhibit({required this.title, required this.images});

  Exhibit.fromJson(Map<String, dynamic> json)
      : images = [...json["images"]],
        title = json['title'];
}
