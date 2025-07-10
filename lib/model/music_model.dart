class AllPosts {
  String? postId;
  String? description;
  String? postAudio;
  String? thumbImage;

  AllPosts({this.postId, this.description, this.postAudio, this.thumbImage});

  AllPosts.fromJson(Map<String, dynamic> json) {
    postId = json["post_id"];
    description = json["description"];
    postAudio = json["post_audio"];
    thumbImage = json["thumb_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["post_id"] = postId;
    data["description"] = description;
    data["post_audio"] = postAudio;
    data["thumb_image"] = thumbImage;
    return data;
  }

  static List<AllPosts> getMusicModel(List data) {
    return data.map((mdata) => AllPosts.fromJson(mdata)).toList();
  }
}
