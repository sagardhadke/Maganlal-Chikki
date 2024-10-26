class HomeImageGallery {
  String? image;

  HomeImageGallery({this.image});

  HomeImageGallery.fromJson(Map<String, dynamic> json) {
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["image"] = image;
    return _data;
  }

  static List<HomeImageGallery>? ofHomeImageGall(List ofData) {
    return ofData.map((e) => HomeImageGallery.fromJson(e)).toList();
  }
}
