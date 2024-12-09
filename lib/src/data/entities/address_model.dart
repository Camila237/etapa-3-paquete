import 'package:paquete_fake_api_store_etapa_3/src/data/entities/geolocation_model.dart';

/// * The AddressModel class is a model class that represents an address.
/// * It contains information about the address, such as the geolocation, city, street, number, and zipcode.
class AddressModel{
  GeolocationModel geolocation;
  final String city;
  final String street;
  final int number;
  final String zipcode;

  AddressModel({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });


  /// * The fromJson method is a factory method that creates an AddressModel instance from a JSON object.
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      geolocation: GeolocationModel.fromJson(json['geolocation']),
      city: json['city'],
      street: json['street'],
      number: json['number'],
      zipcode: json['zipcode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'geolocation': geolocation.toJson(),
      'city': city,
      'street': street,
      'number': number,
      'zipcode': zipcode,
    };
  }

  @override
  String toString() {
    return 'AddressModel{geolocation: $geolocation, city: $city, street: $street, number: $number, zipcode: $zipcode}';
  }
}