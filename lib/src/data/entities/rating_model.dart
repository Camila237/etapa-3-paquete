/// * The RatingModel class is a model class that represents a rating.
/// * It contains information about the rating, such as the rate and count.
class RatingModel{
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  /// * The fromJson method is a factory method that creates a RatingModel instance from a JSON object.
  factory RatingModel.fromJson(
      Map<String, dynamic> json) {
    return RatingModel(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'],
    );
  }

  /// * The toJson method is a method that converts a RatingModel instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  @override
  String toString() {
    return 'RatingModel{rate: $rate, count: $count}';
  }
}