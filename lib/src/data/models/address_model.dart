import 'package:paquete_fake_api_store_etapa_3/src/data/models/geolocation_model.dart';

/// * The AddressModel class is a model class that represents an address.
/// * It contains information about the address, such as the geolocation, city, street, number, and zipcode.
class AddressModel{
  GeolocationModel? geolocation;
  final String? city;
  final String? street;
  final int? number;
  final String? zipcode;

  AddressModel({
    this.geolocation,
    this.city,
    this.street,
    this.number,
    this.zipcode,
  });


  /// * The fromJson method is a factory method that creates an AddressModel instance from a JSON object.
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      geolocation: GeolocationModel.fromJson(json['geolocation'] ??  GeolocationModel(lat: 'Latitud no definida', long: 'Longitud no definida')),
      city: json['city'] ?? 'Ciudad no definida',
      street: json['street'] ?? 'Calle no definida',
      number: json['number'] ?? 0,
      zipcode: json['zipcode'] ?? 'Codigo postal no definido',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'geolocation': geolocation != null ? geolocation!.toJson()  : {},
      'city': city ?? 'Ciudad no definida',
      'street': street ?? 'Calle no definida',
      'number': number ?? 0,
      'zipcode': zipcode ?? 'Codigo postal no definido',
    };
  }

  @override
  String toString() {
    return 'AddressModel{geolocation: $geolocation, city: $city, street: $street, number: $number, zipcode: $zipcode}';
  }
}