import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:paquete_fake_api_store_etapa_3/src/data/apiClient/api_client.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/apiClient/api_error.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/entities/cart_model.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/entities/product_model.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/entities/user_model.dart';
import 'package:paquete_fake_api_store_etapa_3/src/utils/app_constants.dart';

/// * Class to make HTTP requests.
class HttpClient {
  final http.Client client;

  HttpClient(this.client);

  /// * Method to make a GET request.
  Future<Either<ApiError, http.Response>> get(String url) async {
    try {
      final http.Response response = await client.get(Uri.parse(url));
      return _handleResponse(response);
    } catch (e) {
      return Left(ApiError('Ocurrió un error inesperado: ${e.toString()}'));
    }
  }

  /// * Method to make a POST request.
  Future<Either<ApiError, http.Response>> post(String url, {Map<String, dynamic>? body}) async {
    try {
      final http.Response response = await client.post(Uri.parse(url), body: body);
      return _handleResponse(response);
    } catch (e) {
      return Left(ApiError('Ocurrió un error inesperado: ${e.toString()}'));
    }
  }

  /// * Method to handle the response.
  Either<ApiError, http.Response> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return Right(response);
    } else {
      return Left(ApiError(_getErrorMessage(response.statusCode)));
    }
  }

  /// * Method to get the error message based on the status code.
  String _getErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'El servidor no puede procesar tu solicitud';
      case 401:
        return 'No estás autorizado';
      case 404:
        return 'Recurso no encontrado';
      case 500:
        return 'Error interno del servidor';
      default:
        return 'Algo salió mal...';
    }
  }
}

/// * Implemtation of the first API consumption
class ProductsApiService implements ApiClient {
  final HttpClient httpClient;

  ProductsApiService(this.httpClient);

  @override
  Future<Either<ApiError, List<ProductModel>>> fetchData() async {
    final Either<ApiError, http.Response> response = await httpClient.get('$appUrl/products/');
    return response.fold(
          (error) => Left(error),
          (data) {
        final List<dynamic> jsonList = json.decode(data.body);
        final List<ProductModel> products = jsonList.map((json) => ProductModel.fromJson(json)).toList();
        return Right(products);
      },
    );
  }
}

/// * Implemtation of the second API consumption
class UsersApiService implements ApiClient {
  final HttpClient httpClient;

  UsersApiService(this.httpClient);

  @override
  Future<Either<ApiError, List<UserModel>>> fetchData() async{
    final Either<ApiError, http.Response>response = await httpClient.get('$appUrl/users/');
    return response.fold(
          (error) => Left(error),
          (data) {
        final List<dynamic> jsonList = json.decode(data.body);
        final List<UserModel>users = jsonList.map((json) => UserModel.fromJson(json)).toList();
        return Right(users);
      },
    );
  }
}

/// * Implemtation of the third API consumption
class CartsApiService implements ApiClient {
  final HttpClient httpClient;

  CartsApiService(this.httpClient);

  @override
  Future<Either<ApiError, List<CartModel>>> fetchData() async{
    final Either<ApiError, http.Response> response = await httpClient.get('$appUrl/carts/');
    return response.fold(
          (error) => Left(error),
          (data) {
        final List<dynamic> jsonList = json.decode(data.body);
        final List<CartModel> carts = jsonList.map((json) => CartModel.fromJson(json)).toList();
        return Right(carts);
      },
    );
  }
}