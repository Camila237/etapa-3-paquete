import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:paquete_fake_api_store_etapa_3/src/data/apiClient/api_error.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/apiClient/http_client.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/models/product_model.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/models/user_model.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/models/cart_model.dart';
import 'package:paquete_fake_api_store_etapa_3/src/domain/services/products_api_service.dart';
import 'package:paquete_fake_api_store_etapa_3/src/domain/services/users_api_service.dart';
import 'package:paquete_fake_api_store_etapa_3/src/domain/services/carts_api_service.dart';

/// * FetchProducts gets a list of products from the API and prints them to the console.
/// * This function uses the [ApiClient] client to make an HTTP request
/// * and get products. Then loops through the response and displays information
/// * about each product, including its name, price, and rating.
/// * If an error occurs, the server error message is displayed.
Future<List<ProductModel>> fetchProducts() async {
  List<ProductModel> productsResult = [];
  final HttpClient httpClient = HttpClient(http.Client());
  final ProductsApiService productsApiService = ProductsApiService(httpClient);
  print('--------------------------');
  print('Obteniendo productos...');
  final Either<ApiError, List<ProductModel>> response = await productsApiService.fetchData();
  response.fold(
        (ApiError error) => print(error.message),
        (List<ProductModel>products) => productsResult = products,
  );
  return productsResult;
}

/// * FetchUsers gets a list of users from the API and prints them to the console.
/// * This function uses the [ApiClient] client to make an HTTP request
/// * and get users. Then loops through the response and displays information
/// * about each user, including their name and email.
/// * If an error occurs, the server error message is displayed.
Future<List<UserModel>> fetchUsers() async {
  List<UserModel> usersResult = [];
  final HttpClient httpClient = HttpClient(http.Client());
  final UsersApiService usersApiService = UsersApiService(httpClient);
  print('--------------------------');
  print('Obteniendo usuarios...');
  final  Either<ApiError, List<UserModel>> response = await usersApiService.fetchData();
  response.fold(
        (ApiError error) => print(error.message),
        (List<UserModel>users) => usersResult = users,
  );
  return usersResult;
}

/// * FetchCarts gets a list of carts from the API and prints them to the console.
/// * This function uses the [ApiClient] client to make an HTTP request
/// * and get carts. Then loops through the response and displays information
/// * about each cart, including the user ID and products.
/// * If an error occurs, the server error message is displayed.
Future<List<CartModel>> fetchCarts() async {
  List<CartModel> cartsResult = [];
  final HttpClient httpClient = HttpClient(http.Client());
  final CartsApiService cartsApiService = CartsApiService(httpClient);
  print('--------------------------');
  print('Obteniendo carritos...');
  final Either<ApiError, List<CartModel>> response = await cartsApiService.fetchData();
  response.fold(
        (ApiError error) => print(error.message),
        (List<CartModel> carts) => cartsResult = carts,
  );
  return cartsResult;
}