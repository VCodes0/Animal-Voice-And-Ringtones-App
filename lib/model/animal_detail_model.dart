class AnimalDetailModel {
  String? id;
  String? postAudio;
  String? description;

  AnimalDetailModel({this.id, this.postAudio, this.description});

  AnimalDetailModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    postAudio = json["post_audio"];
    description = json["description"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["post_audio"] = postAudio;
    data["description"] = description;
    return data;
  }

  static List<AnimalDetailModel> sendAnimalDetails(List data) {
    return data.map((e) => AnimalDetailModel.fromJson(e)).toList();
  }
}
