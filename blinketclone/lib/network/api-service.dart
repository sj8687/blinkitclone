import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:3000",
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  ApiService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
         
          String? token = await storage.read(key: 'jwt');

          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }

          return handler.next(options);
        },
        onError: (e, handler) {
          print("API Error: ${e.message}");
          return handler.next(e);
        },
      ),
    );
  }

  Dio get dio => _dio;
}