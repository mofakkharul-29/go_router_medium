import 'package:dio/dio.dart';
import 'package:routing/repository/dio_config/dio_configuration.dart';

class DioClient extends DioConfiguration {
  DioClient() : super(endpoint: '', method: HttpMethod.get);

  @override
  Object? get body => null;

  Future<Response> getData(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio.get(
      endpoint,
      queryParameters: queryParams,
    );
  }

  Future<Response> getProductById(
    endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio.get(
      endpoint,
      queryParameters: queryParams,
    );
  }

  Future<Response> postData(
    String endpoint,
    Map<String, dynamic> data, {
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio.post(
      endpoint,
      data: data,
      queryParameters: queryParams,
    );
  }

  Future<Response> putData(
    String endpoint,
    Map<String, dynamic> data, {
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio.put(
      endpoint,
      data: data,
      queryParameters: queryParams,
    );
  }

  Future<Response> deleteData(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio.delete(
      endpoint,
      queryParameters: queryParams,
    );
  }
}
