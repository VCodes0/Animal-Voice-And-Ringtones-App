class AnimalCategory {
  String? id;
  String? catName;
  String? catImage;
  String? thumbImage;

  AnimalCategory({this.id, this.catName, this.catImage, this.thumbImage});

  AnimalCategory.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    catName = json["cat_name"];
    catImage = json["cat_image"];
    thumbImage = json["thumb_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["cat_name"] = catName;
    data["cat_image"] = catImage;
    data["thumb_image"] = thumbImage;
    return data;
  }

  static List<AnimalCategory> getAnimalCategory(List data) {
    return data.map((item) => AnimalCategory.fromJson(item)).toList();
  }
}
