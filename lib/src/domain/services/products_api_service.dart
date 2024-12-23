import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:paquete_fake_api_store_etapa_3/src/data/apiClient/api_client.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/apiClient/api_error.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/apiClient/http_client.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/models/product_model.dart';
import 'package:paquete_fake_api_store_etapa_3/src/utils/app_constants.dart';

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
