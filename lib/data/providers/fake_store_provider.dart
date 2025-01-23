// fake_store_provider.dart
import 'package:dio/dio.dart';

class FakeStoreProvider {
  final Dio _dio;

  FakeStoreProvider(this._dio);

  static const baseUrl = 'https://fakestoreapi.com';

  Future<List<dynamic>> getProductsList() async {
    final response = await _dio.get('$baseUrl/products');

    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception(
          'Error en getProductsList, status: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> getProductDetail(int id) async {
    final response = await _dio.get('$baseUrl/products/$id');

    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception(
          'Error en getProductDetail($id), status: ${response.statusCode}');
    }
  }
}
