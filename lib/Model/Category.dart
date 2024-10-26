class Category {
  String? id;
  String? catName;
  String? catImage;
  int? noOfPost;

  Category({this.id, this.catName, this.catImage, this.noOfPost});

  Category.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    catName = json["cat_name"];
    catImage = json["cat_image"];
    noOfPost = json["no_of_post"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["cat_name"] = catName;
    _data["cat_image"] = catImage;
    _data["no_of_post"] = noOfPost;
    return _data;
  }

  static List<Category>? ofCategory(List ofData) {
    return ofData.map((e) => Category.fromJson(e)).toList();
  }
}
