class BannerImage {
  String? id;
  String? title;
  String? bannerImage;

  BannerImage({this.id, this.title, this.bannerImage});

  BannerImage.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    bannerImage = json["banner_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["banner_image"] = bannerImage;
    return _data;
  }

  static List<BannerImage>? ofBannerImage(List ofData) {
    return ofData.map((e) => BannerImage.fromJson((e))).toList();
  }
}
