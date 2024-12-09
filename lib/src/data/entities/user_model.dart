import 'package:paquete_fake_api_store_etapa_3/src/data/entities/address_model.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/entities/name_model.dart';

/// * The UserModel class is a model class that represents a user.
/// * It contains information about the user, such as its ID, email, username, password, name, phone, and address.
class UserModel{
  final AddressModel address;
  final int id;
  final String email;
  final String username;
  final String password;
  final NameModel name;
  final String phone;

  UserModel({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
  });

  /// * The fromJson method is a factory method that creates a UserModel instance from a JSON object.
  factory UserModel.fromJson(
      Map<String, dynamic> json) {
    return UserModel(
      address: AddressModel.fromJson(json['address']),
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      name: NameModel.fromJson(json['name']),
      phone: json['phone'],
    );
  }

  /// * The toJson method is a method that converts a UserModel instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'address': address.toJson(),
      'id': id,
      'email': email,
      'username': username,
      'password': password,
      'name': name.toJson(),
      'phone': phone,
    };
  }

  @override
  String toString() {
    return 'UserModel{address: $address, id: $id, email: $email, username: $username, password: $password, name: $name, phone: $phone}';
  }
}