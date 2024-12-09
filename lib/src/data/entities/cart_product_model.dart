/// * The CartProductModel class is a model class that represents a cart product.
/// * It contains information about the product ID and quantity.
class CartProductModel{
  final int productId;
  final int quantity;

  CartProductModel({
    required this.productId,
    required this.quantity,
  });

  /// * The fromJson method is a factory method that creates a CartProductModel instance from a JSON object.
  factory CartProductModel.fromJson(
      Map<String, dynamic> json) {
    return CartProductModel(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }

  /// * The toJson method is a method that converts a CartProductModel instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }

  @override
  String toString() {
    return 'CartProductModel{productId: $productId, quantity: $quantity}';
  }
}