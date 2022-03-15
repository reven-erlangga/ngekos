class Feature {
  int? id;
  String? kitchen;
  String? bedroom;
  String? cupboard;

  Feature({
    this.id,
    this.kitchen,
    this.bedroom,
    this.cupboard,
  });

  Feature.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kitchen = json['kitchen'];
    bedroom = json['bedroom'];
    cupboard = json['cupboard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['kitchen'] = this.kitchen;
    data['bedroom'] = this.bedroom;
    data['cupboard'] = this.cupboard;

    return data;
  }
}
