import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class ApiProvider extends GetConnect {
  late Dio _dio;

  final String baseUrl = 'https://your-api.com/api';

  @override
  void onInit() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add auth token
        return handler.next(options);
      },
      onError: (error, handler) {
        // Handle errors
        return handler.next(error);
      },
    ));

    super.onInit();
  }

  Future<Response> getRequest(String endpoint) async {
    return await _dio.get(endpoint);
  }

  Future<Response> postRequest(String endpoint, dynamic data) async {
    return await _dio.post(endpoint, data: data);
  }
}