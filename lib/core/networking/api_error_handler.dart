import 'package:dio/dio.dart';
import 'package:ai_chat_bot/core/errors/failure.dart';

class ApiErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else {
      return const ServerFailure('Something went wrong, please try again later.');
    }
  }

  static Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout with API server');
      case DioExceptionType.badCertificate:
        return const ServerFailure('Bad certificate with API server');
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);
      case DioExceptionType.cancel:
        return const ServerFailure('Request to API server was cancelled');
      case DioExceptionType.connectionError:
        return const ServerFailure('No internet connection');
      case DioExceptionType.unknown:
        return const ServerFailure('Unexpected error occurred');
    }
  }

  static Failure _handleBadResponse(Response? response) {
    if (response != null && response.data != null) {
      // You can customize this based on your API response structure
      // For Gemini, errors might be in response.data['error']['message']
      final dynamic errorData = response.data;
      if (errorData is Map && errorData.containsKey('error')) {
        final error = errorData['error'];
        if (error is Map && error.containsKey('message')) {
          return ServerFailure(error['message']);
        }
      }
    }

    switch (response?.statusCode) {
      case 400:
        return const ServerFailure('Bad request');
      case 401:
        return const ServerFailure('Unauthorized');
      case 403:
        return const ServerFailure('Forbidden');
      case 404:
        return const ServerFailure('Not found');
      case 500:
        return const ServerFailure('Internal server error');
      default:
        return const ServerFailure('Something went wrong');
    }
  }
}
