class AboutModel {
  String? title;
  String? description;
  String? image;
  String? ourTeam;
  String? history;
  String? clientSatisfaction;

  AboutModel(
      {this.title,
      this.description,
      this.image,
      this.ourTeam,
      this.history,
      this.clientSatisfaction});

  AboutModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    description = json["description"];
    image = json["image"];
    ourTeam = json["our_team"];
    history = json["history"];
    clientSatisfaction = json["client_satisfaction"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["description"] = description;
    _data["image"] = image;
    _data["our_team"] = ourTeam;
    _data["history"] = history;
    _data["client_satisfaction"] = clientSatisfaction;
    return _data;
  }

  static List<AboutModel>? ofAbout(List ofData) {
    return ofData.map((e) => AboutModel.fromJson(e)).toList();
  }
}
