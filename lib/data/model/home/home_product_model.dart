// To parse this JSON data, do
//
//     final homeProductModel = homeProductModelFromJson(jsonString);
import 'dart:convert';

List<HomeProductModel> homeProductModelFromJson(String str) => List<HomeProductModel>.from(json.decode(str).map((x) => HomeProductModel.fromJson(x)));

String homeProductModelToJson(List<HomeProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeProductModel {
  final String? id;
  final String? createdAt;
  final String? name;
  final String? price;
  final String? rating;
  final String? image;
  int? quantity;
  final String? reviews;

  HomeProductModel({
    this.id,
    this.createdAt,
    this.name,
    this.price,
    this.rating,
    this.image,
    this.quantity,
    this.reviews = '0 Reviews',
  });

  HomeProductModel copyWith({
    String? id,
    String? createdAt,
    String? name,
    String? price,
    String? rating,
    String? image,
    int? quantity,
    String? reviews,
    String? description,
    String? category,
    bool? isFavorite,
  }) =>
      HomeProductModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        price: price ?? this.price,
        rating: rating ?? this.rating,
        image: image ?? this.image,
        quantity: quantity ?? this.quantity,
        reviews: reviews ?? this.reviews,
      );

  factory HomeProductModel.fromJson(Map<String, dynamic> json) => HomeProductModel(
        id: json["id"],
        createdAt: json["createdAt"],
        name: json["name"],
        price: json["price"],
        rating: json["rating"],
        image: json["image"],
        quantity: json["quantity"] ?? 1,
        reviews: json["reviews"] ?? '0 Reviews',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt,
        "name": name,
        "price": price,
        "rating": rating,
        "image": image,
        "quantity": quantity,
        "reviews": reviews,
      };
}
