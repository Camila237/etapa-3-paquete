/// * The CartProductModel class is a model class that represents a cart product.
/// * It contains information about the product ID and quantity.
class CartProductModel{
  final int? productId;
  final int? quantity;

  CartProductModel({
    this.productId,
    this.quantity,
  });

  /// * The fromJson method is a factory method that creates a CartProductModel instance from a JSON object.
  factory CartProductModel.fromJson(
      Map<String, dynamic> json) {
    return CartProductModel(
      productId: json['productId'] ?? 0,
      quantity: json['quantity'] ?? 0,
    );
  }

  /// * The toJson method is a method that converts a CartProductModel instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'productId': productId ?? 0,
      'quantity': quantity ?? 0,
    };
  }

  @override
  String toString() {
    return 'CartProductModel{productId: $productId, quantity: $quantity}';
  }
}