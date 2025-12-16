import 'package:dio/dio.dart';

class Failure {
  final int code;
  final String message;

  const Failure(this.code, this.message);

  @override
  String toString() => 'Failure(code: $code, message: $message)';
}

class ErrorStrings {
  static const String strSuccess = "Success";
  static const String strBadRequestError = "User does not exist";
  static const String strNoContent = "Success with no content";
  static const String strForbiddenError = "Forbidden request. Try again later";
  static const String strUnauthorizedError =
      "User is unauthorized. Log in again";
  static const String strNotFoundError = "Url not found. Try again later";
  static const String strInternalServerError =
      "Internal server error. Try again later";
  static const String strTimeoutError = "Timeout error. Check your connection";
  static const String strDefaultError = "Something went wrong. Try again later";
  static const String strCacheError = "Cache error. Try again later";
  static const String strNoInternetError =
      "No internet connection. Check your network";
}

/// A unified enum representing all possible data source failure types.
enum DataSource {
  // HTTP errors (4xx & 5xx)
  badRequest(400, ErrorStrings.strBadRequestError),
  unauthorised(401, ErrorStrings.strUnauthorizedError),
  forbidden(403, ErrorStrings.strForbiddenError),
  notFound(404, ErrorStrings.strNotFoundError),
  internalServerError(500, ErrorStrings.strInternalServerError),
  noContent(201, ErrorStrings.strNoContent),

  // Dio/Local errors (negative codes)
  connectTimeout(-1, ErrorStrings.strTimeoutError),
  cancel(-2, ErrorStrings.strDefaultError),
  receiveTimeout(-3, ErrorStrings.strTimeoutError),
  sendTimeout(-4, ErrorStrings.strTimeoutError),
  cacheError(-5, ErrorStrings.strCacheError),
  noInternetConnection(-6, ErrorStrings.strNoInternetError),
  connectionError(
    -9,
    ErrorStrings.strDefaultError,
  ), // Mapping to 'connectionError'

  // General/Fallback
  defaultError(-8, ErrorStrings.strDefaultError),
  success(200, ErrorStrings.strSuccess);

  // Enum constructor to store code and message directly
  final int code;
  final String message;
  const DataSource(this.code, this.message);

  // The 'failure' getter is now extremely simple
  Failure get failure => Failure(code, message);

  // Helper to map HTTP status codes to a DataSource enum value
  static DataSource? fromCode(int? code) {
    if (code == null) return null;
    return switch (code) {
      400 => badRequest,
      401 => unauthorised,
      403 => forbidden,
      404 => notFound,
      500 => internalServerError,
      201 => noContent,
      200 => success,
      _ => null, // Default handling will use this if no match
    };
  }
}

// --- 4. The Error Handler ---

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleDioError(error);
    } else {
      // Default error for non-Dio errors (e.g., parsing, unexpected exceptions)
      failure = DataSource.defaultError.failure;
    }
  }

  Failure _handleDioError(DioException error) {
    return switch (error.type) {
      DioExceptionType.connectionTimeout => DataSource.connectTimeout.failure,
      DioExceptionType.sendTimeout => DataSource.sendTimeout.failure,
      DioExceptionType.receiveTimeout => DataSource.receiveTimeout.failure,
      DioExceptionType.cancel => DataSource.cancel.failure,
      DioExceptionType.connectionError => DataSource.connectionError.failure,

      // Handle response-based errors (4xx, 5xx)
      DioExceptionType.badResponse => _handleBadResponse(error),

      // Handle specific default errors
      DioExceptionType.badCertificate => DataSource.defaultError.failure,

      // Handle all other unknown errors
      DioExceptionType.unknown => _handleDefaultError(error),
    };
  }

  Failure _handleBadResponse(DioException error) {
    final code = error.response?.statusCode;
    final dataSource = DataSource.fromCode(code);

    if (dataSource != null) {
      if (code == 400) {
        return Failure(code!, _extractErrorMessage(error.response?.data));
      }
      // Known HTTP status code, use its pre-defined failure
      return dataSource.failure;
    } else {
      // Unknown HTTP status code (e.g., 405 Method Not Allowed)
      // Try to extract a custom message, otherwise use generic server error.
      final extractedMessage = _extractErrorMessage(error.response?.data);
      if (extractedMessage.isNotEmpty) {
        return Failure(code ?? DataSource.defaultError.code, extractedMessage);
      }
      // Fallback to the generic internal server error
      return DataSource.internalServerError.failure;
    }
  }

  Failure _handleDefaultError(DioException error) {
    // If the DioExceptionType.unknown contains a response, check if it's a known error
    final code = error.response?.statusCode;
    final dataSource = DataSource.fromCode(code);

    if (dataSource != null) {
      return dataSource.failure;
    }

    // Fallback to the generic default error.
    return DataSource.defaultError.failure;
  }

  /// Helper to extract a message from the response body.
  /// Note: The original logic for extracting messages from complex map structures
  /// is preserved as it is a specific requirement.
  String _extractErrorMessage(dynamic data) {
    if (data == null) {
      return '';
    }

    if (data is String) {
      return data;
    }

    if (data is Map<String, dynamic>) {
      if (data.containsKey('message') && data['message'] is String) {
        return data['message'];
      }
      if (data.containsKey('error') && data['error'] is String) {
        return data['error'];
      }

      // Fallback: Concatenate all values
      String message = '';
      data.forEach((key, value) {
        if (value is List) {
          message += value.map((e) => e.toString()).join('\n') + '\n';
        } else if (value is String) {
          message += value + '\n';
        } else {
          message += value.toString() + '\n';
        }
      });
      return message.trim();
    }

    return data.toString();
  }
}
