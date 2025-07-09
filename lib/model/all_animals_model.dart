class AllAnimals {
  String? id;
  String? catName;
  String? catImg;
  String? thumbImage;

  AllAnimals({this.id, this.catName, this.catImg, this.thumbImage});

  AllAnimals.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    catName = json["cat_name"];
    catImg = json["cat_img"];
    thumbImage = json["thumb_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["cat_name"] = catName;
    data["cat_img"] = catImg;
    data["thumb_image"] = thumbImage;
    return data;
  }

  static List<AllAnimals> getAllAnimals(List data) {
    return data.map((item) => AllAnimals.fromJson(item)).toList();
  }
}
