import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:paquete_fake_api_store_etapa_3/src/data/apiClient/api_client.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/apiClient/api_error.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/apiClient/http_client.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/models/cart_model.dart';
import 'package:paquete_fake_api_store_etapa_3/src/utils/app_constants.dart';


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