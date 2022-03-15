import 'package:flutter_ngekos/models/city.dart';
import 'package:flutter_ngekos/models/country.dart';
import 'package:flutter_ngekos/models/feature.dart';
import 'package:flutter_ngekos/models/photo.dart';

class Place {
  int? id;
  String? name;
  String? description;
  int? price;
  int? rating;
  String? address;
  String? phone;
  String? imageUrl;
  String? mapUrl;
  City? city;
  Country? country;
  Feature? feature;
  List<Photo>? photo;
  bool isFavorite = false;

  Place(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.rating,
      this.address,
      this.phone,
      this.imageUrl,
      this.mapUrl,
      this.city,
      this.country,
      this.feature,
      this.photo,
      this.isFavorite = false});

  Place.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['mapUrl'];
    imageUrl = json['imageUrl'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    feature =
        json['feature'] != null ? new Feature.fromJson(json['feature']) : null;
    if (json['photo'] != null) {
      photo = <Photo>[];
      json['photo'].forEach((v) {
        photo!.add(new Photo.fromJson(v));
      });
    }
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['mapUrl'] = this.mapUrl;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.feature != null) {
      data['feature'] = this.feature!.toJson();
    }
    if (this.photo != null) {
      data['photo'] = this.photo!.map((v) => v.toJson()).toList();
    }
    data['isFavorite'] = this.isFavorite;

    return data;
  }
}
