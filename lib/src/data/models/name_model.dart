/// * The NameModel class is a model class that represents a name.
/// * It contains information about the name, such as the first name and last name.
class NameModel{
  final String? firstname;
  final String? lastname;

  NameModel({
    this.firstname,
    this.lastname,
  });

  /// * The fromJson method is a factory method that creates a NameModel instance from a JSON object.
  factory NameModel.fromJson(
      Map<String, dynamic> json) {
    return NameModel(
      firstname: json['firstname'] ?? 'Nombre no definido',
      lastname: json['lastname'] ?? 'Apellido no definido',
    );
  }

  /// * The toJson method is a method that converts a NameModel instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname ?? 'Nombre no definido',
      'lastname': lastname ?? 'Apellido no definido',
    };
  }

  @override
  String toString() {
    return 'NameModel{firstname: $firstname, lastname: $lastname}';
  }
}