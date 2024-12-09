import 'package:paquete_fake_api_store_etapa_3/src/data/entities/cart_product_model.dart';

/// * The CartModel class is a model class that represents a cart.
/// * It contains information about the cart, such as its ID, user ID, date, and products.
class CartModel{
 final int id;
 final int userId;
 final String date;
 final List<CartProductModel> products;

  CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  /// * The fromJson method is a factory method that creates a CartModel instance from a JSON object.
 factory CartModel.fromJson(
     Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      userId: json['userId'],
      date: json['date'],
      products: (json['products'] as List)
          .map((product) => CartProductModel.fromJson(product))
          .toList(),
    );
  }

 /// * The toJson method is a method that converts a CartModel instance to a JSON object.
 Map<String, dynamic> toJson() {
   return {
     'id': id,
     'userId': userId,
     'date': date,
     'products': products.map((product) => product.toJson()).toList(),
   };
 }

 @override
  String toString() {
    return 'CartModel{id: $id, userId: $userId, date: $date, products: $products}';
 }
}