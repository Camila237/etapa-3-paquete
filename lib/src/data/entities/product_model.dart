import 'package:paquete_fake_api_store_etapa_3/src/data/entities/rating_model.dart';

/// * The ProductModel class is a model class that represents a product.
/// * It contains information about the product, such as its ID, title, description, category, price, image, and rating.
class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.image,
    required this.rating,
  });


  /// * [fromJson] is a factory method that creates a [ProductModel] instance from a JSON object.
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      rating: RatingModel.fromJson(json['rating']),
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
      'rating': rating.toJson(),
    };
  }
}