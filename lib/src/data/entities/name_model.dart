/// * The NameModel class is a model class that represents a name.
/// * It contains information about the name, such as the first name and last name.
class NameModel{
  final String firstname;
  final String lastname;

  NameModel({
    required this.firstname,
    required this.lastname,
  });

  /// * The fromJson method is a factory method that creates a NameModel instance from a JSON object.
  factory NameModel.fromJson(
      Map<String, dynamic> json) {
    return NameModel(
      firstname: json['firstname'],
      lastname: json['lastname'],
    );
  }

  /// * The toJson method is a method that converts a NameModel instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
    };
  }

  @override
  String toString() {
    return 'NameModel{firstname: $firstname, lastname: $lastname}';
  }
}