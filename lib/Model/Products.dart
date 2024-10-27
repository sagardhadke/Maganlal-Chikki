class Products {
  String? id;
  String? title;
  List<String>? images;
  String? price;
  String? smallDescription;
  String? fullDescription;

  Products(
      {this.id,
      this.title,
      this.images,
      this.price,
      this.smallDescription,
      this.fullDescription});

  Products.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    images = json["images"] == null ? null : List<String>.from(json["images"]);
    price = json["price"];
    smallDescription = json["small_description"];
    fullDescription = json["full_description"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    if (images != null) {
      _data["images"] = images;
    }
    _data["price"] = price;
    _data["small_description"] = smallDescription;
    _data["full_description"] = fullDescription;
    return _data;
  }

  static List<Products>? ofProducts(List ofData) {
    return ofData.map((e) => Products.fromJson(e)).toList();
  }
}
