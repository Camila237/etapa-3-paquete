import 'package:paquete_fake_api_store_etapa_3/src/data/models/cart_product_model.dart';

/// * The CartModel class is a model class that represents a cart.
/// * It contains information about the cart, such as its ID, user ID, date, and products.
class CartModel{
 final int? id;
 final int? userId;
 final String? date;
 final List<CartProductModel>? products;

  CartModel({
    this.id,
    this.userId,
    this.date,
    this.products,
  });

  /// * The fromJson method is a factory method that creates a CartModel instance from a JSON object.
 factory CartModel.fromJson(
     Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      date: json['date'] ?? 'Fecha no definida',
      products: (json['products'] as List?)
          ?.map((product) => CartProductModel.fromJson(product))
          .toList() ?? [],
    );
  }

 /// * The toJson method is a method that converts a CartModel instance to a JSON object.
 Map<String, dynamic> toJson() {
   return {
     'id': id ?? 0,
     'userId': userId ?? 0,
     'date': date ?? '',
     'products':  products != null ? products!.map((product) => product.toJson()).toList() : [],
   };
 }

 @override
  String toString() {
    return 'CartModel{id: $id, userId: $userId, date: $date, products: $products}';
 }
}