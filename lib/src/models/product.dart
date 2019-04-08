import 'package:flutter/foundation.dart';

enum Category {
  Accueil,
  Dessin,
  Painture,
  Sculpture
}

class Product {
  const Product({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.category,
    @required this.artistEmail,
    @required this.isFeatured,
    @required this.image,
  })  : assert(category != null),
        assert(id != null),
        assert(isFeatured != null),
        assert(name != null),
        assert(price != null);

  final int id;
  final String name;
  final double price;
  final Category category;
  final String description;
  final String artistEmail;
  final bool isFeatured;
  final String image;



  String get assetName => '$id.jpg';
  String get assetPackage => 'images';

  @override
  String toString() => '$name (id=$id)';

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as double,
      category: json['category'] as Category,
      description: json['description'] as String,
      artistEmail: json['artistEmail'] as String,
      isFeatured: json['isFeatured'] as bool
    );
  }
}
