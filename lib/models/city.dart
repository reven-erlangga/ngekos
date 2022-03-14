class City {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  bool isPopuler = false;

  City(
      {this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.isPopuler = false});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    isPopuler = json['isPopuler'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['isPopuler'] = this.isPopuler;

    return data;
  }
}
