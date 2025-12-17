import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:own_starbucks/client/model/api_endpoints.dart';
import 'package:own_starbucks/client/model/api_exceptions.dart';
import 'package:own_starbucks/client/model/api_interceptors.dart';
import 'package:own_starbucks/client/model/api_response.dart';

abstract class ApiClient {
  final Dio _dio;

  ApiClient({required Dio dio})
    : _dio = Dio(
        BaseOptions(
          receiveTimeout: const Duration(seconds: 30),
          connectTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
        ),
      )..interceptors.add(ApiInterceptors());

  Future<ApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    String? baseUrl,
    String? secretKey,
    String? cancelKey,
  }) async {
    try {
      final response = await _dio.get<T>(
        "${baseUrl ?? ApiEndpoints.baseUrl}$path",
        queryParameters: queryParameters,
        options: options,
      );
      return ApiResponse<T>.fromJson(
        response.data,
        fromJsonT: (json) => json as T,
      );
    } on DioException catch (e) {
      throw ApiExceptions.fromDioError(e);
    } catch (e) {
      throw ApiExceptions("Unknown error occured", statusCode: 500);
    }
  }

  Future<ApiResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    String? baseUrl,
    String? secretKey,
    bool isJson = true,
    String? cancelKey,
  }) async {
    try {
      final response = await _dio.post<T>(
        "${baseUrl ?? ApiEndpoints.baseUrl}$path",
        data: isJson ? jsonEncode(data) : data,
        queryParameters: queryParameters,
        options: options,
      );
      return ApiResponse<T>.fromJson(
        response.data,
        fromJsonT: (json) => json as T,
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw ApiExceptions(
          "Request cancelled",
          statusCode: e.response?.statusCode,
        );
      }
      throw ApiExceptions.fromDioError(e);
    } catch (e) {
      throw ApiExceptions('Unknown error occurred', statusCode: 500);
    }
  }

  Future<ApiResponse<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    String? baseUrl,
    String? secretKey,
    bool isJson = true,
  }) async {
    try {
      final response = await _dio.put<T>(
        "${baseUrl ?? ApiEndpoints.baseUrl}$path",
        data: isJson ? jsonEncode(data) : data,
        queryParameters: queryParameters,
        options: options,
      );
      return ApiResponse<T>.fromJson(
        response.data,
        fromJsonT: (json) => json as T,
      );
    } on DioException catch (e) {
      throw ApiExceptions.fromDioError(e);
    } catch (e) {
      throw ApiExceptions('Unknown error occurred: $e');
    }
  }

  Future<ApiResponse<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    String? baseUrl,
    String? secretKey,
  }) async {
    try {
      final response = await _dio.delete<T>(
        "${baseUrl ?? ApiEndpoints.baseUrl}$path",
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return ApiResponse<T>.fromJson(
        response.data,
        fromJsonT: (json) => json as T,
      );
    } on DioException catch (e) {
      throw ApiExceptions.fromDioError(e);
    } catch (e) {
      throw ApiExceptions('Unknown error occurred');
    }
  }

  Future<ApiResponse<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    String? baseUrl,
    String? secretKey,
  }) async {
    try {
      final response = await _dio.patch<T>(
        "${baseUrl ?? ApiEndpoints.baseUrl}$path",
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return ApiResponse<T>.fromJson(
        response.data,
        fromJsonT: (json) => json as T,
      );
    } on DioException catch (e) {
      throw ApiExceptions.fromDioError(e);
    } catch (e) {
      throw ApiExceptions('Unknown error occurred');
    }
  }
}
