import 'package:paquete_fake_api_store_etapa_3/src/data/models/rating_model.dart';

/// * The ProductModel class is a model class that represents a product.
/// * It contains information about the product, such as its ID, title, description, category, price, image, and rating.
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


  /// * [fromJson] is a factory method that creates a [ProductModel] instance from a JSON object.
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Título no definido',
      description: json['description'] ?? 'Descripción no definida',
      category: json['category'] ?? 'Categoría no definida',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      image: json['image'] ?? 'Imagen no definida',
      rating: RatingModel.fromJson(json['rating'] ??  RatingModel(rate: 0, count: 0)),
    );
  }

  /// * [toJson] is a method that converts a [ProductModel] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'image': image,
      'rating': rating != null ? rating?.toJson() : {},
    };
  }
}