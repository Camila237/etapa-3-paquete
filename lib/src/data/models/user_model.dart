import 'package:paquete_fake_api_store_etapa_3/src/data/models/address_model.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/models/name_model.dart';

/// * The UserModel class is a model class that represents a user.
/// * It contains information about the user, such as its ID, email, username, password, name, phone, and address.
class UserModel{
  final AddressModel? address;
  final int? id;
  final String? email;
  final String? username;
  final String? password;
  final NameModel? name;
  final String? phone;

  UserModel({
    this.address,
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.phone,
  });

  /// * The fromJson method is a factory method that creates a UserModel instance from a JSON object.
  factory UserModel.fromJson(
      Map<String, dynamic> json) {
    return UserModel(
      address: AddressModel.fromJson(json['address'] ?? AddressModel(city: 'Ciudad no definida', street: 'Calle no definida', number: 0, zipcode: 'Codigo postal no definido')),
      id: json['id'] ?? 0,
      email: json['email'] ?? 'Correo no definido',
      username: json['username'] ?? 'Usuario no definido',
      password: json['password'] ?? 'Contraseña no definida',
      name: NameModel.fromJson(json['name'] ?? NameModel(firstname: 'Nombre no definido', lastname: 'Apellido no definido')),
      phone: json['phone'] ?? 'Teléfono no definido',
    );
  }

  /// * The toJson method is a method that converts a UserModel instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'address': address?.toJson() ?? {},
      'id': id ?? 0,
      'email': email ?? 'Correo no definido',
      'username': username ?? 'Usuario no definido',
      'password': password ?? 'Contraseña no definida',
      'name': name?.toJson() ?? {},
      'phone': phone ?? 'Teléfono no definido',
    };
  }

  @override
  String toString() {
    return 'UserModel{address: $address, id: $id, email: $email, username: $username, password: $password, name: $name, phone: $phone}';
  }
}