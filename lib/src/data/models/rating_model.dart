/// * The RatingModel class is a model class that represents a rating.
/// * It contains information about the rating, such as the rate and count.
class RatingModel{
  final double? rate;
  final int? count;

  RatingModel({
    this.rate,
    this.count,
  });

  /// * The fromJson method is a factory method that creates a RatingModel instance from a JSON object.
  factory RatingModel.fromJson(
      Map<String, dynamic> json) {
    return RatingModel(
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
      count: json['count'] ?? 0,
    );
  }

  /// * The toJson method is a method that converts a RatingModel instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'rate': rate ?? 0.0,
      'count': count ?? 0,
    };
  }

  @override
  String toString() {
    return 'RatingModel{rate: $rate, count: $count}';
  }
}