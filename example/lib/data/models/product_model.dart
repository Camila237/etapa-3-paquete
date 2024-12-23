import 'package:example/data/models/rating_model.dart';

/// * [ProductModel] is a class that represents a product.
/// * It has the following properties:
///  * [id] - the product's ID.
///  * [title] - the product's title.
///  * [description] - the product's description.
///  * [category] - the product's category.
///  * [price] - the product's price.
///  * [image] - the product's image URL.
///  * [rating] - the product's rating.
class ProductModel {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final String? image;
  final RatingModel? rating;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.image,
    this.rating,
  });

  ProductModel copyWith({
    int? id,
    String? title,
    String? description,
    double? price,
    String? image,
    RatingModel? rating,
    String? category,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      category: category ?? this.category,
    );
  }
  static ProductModel get dataDefault => ProductModel(
      id: 0,
      title: 'Data default',
      description: 'description default',
      category: 'category default',
      price: 0,
      image: 'urlPaceholder',
      rating: RatingModel(rate: 0 , count: 0),
  );

  /// * [fromJson] is a factory method that creates a [ProductModel] instance from a JSON object.
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Titulo no definido',
      description: json['description'] ?? 'Descripción no definida',
      category: json['category'] ?? 'Categoría no definida',
      price: json['price']?.toDouble() ?? 0,
      image: json['image'] ?? 'Imagen no definida',
      rating: RatingModel.fromJson(json['rating'] ?? RatingModel(rate: 0.0, count: 0)),
    );
  }

  /// * [toJson] is a method that converts a [ProductModel] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'id': id ?? 0,
      'title': title ?? 'Titulo no definido',
      'description': description ?? 'Descripción no definida',
      'category': category ?? 'Categoría no definida',
      'price': price ?? 0,
      'image': image ?? 'Imagen no definida',
      'rating': rating != null ? rating!.toJson() : RatingModel(rate: 0.0, count: 0),
    };
  }
}
