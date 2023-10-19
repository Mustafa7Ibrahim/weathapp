import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// No internet connection
const noInternetConnection = 'No internet connection';

/// App Interceptors
class AppInterceptors extends Interceptor {
  /// App Interceptors Constructor
  AppInterceptors(this.dio);

  /// Dio
  final Dio dio;

  /// Header accept
  static const acceptHeader = 'accept';

  /// Header content encoding
  static const contentEncodingHeader = 'content-encoding';

  /// Header content length
  static const contentLengthHeader = 'content-length';

  /// Header content type
  static const contentTypeHeader = 'content-type';

  /// Header authorization
  static const authenticateHeader = 'Authorization';

  /// Header application json
  static const applicationJson = 'application/json';

  /// Header bearer
  static const bearer = 'Bearer ';

  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return handler.reject(
        DioException(
          requestOptions: options,
          error: noInternetConnection,
          message: noInternetConnection,
          response: Response(
            requestOptions: options,
            data: noInternetConnection,
            statusCode: 500,
            statusMessage: noInternetConnection,
          ),
          type: DioExceptionType.connectionError,
        ),
      );
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      options
        ..baseUrl = dotenv.env['BASE_URL']!

        /// Redirects true
        ..followRedirects = true
        // Set a timeout of 10 seconds for the request
        ..connectTimeout = const Duration(seconds: 18)
        // Receive data with a timeout of some seconds
        ..receiveTimeout = const Duration(seconds: 30)
        // Send data with a timeout of some seconds
        ..sendTimeout = const Duration(seconds: 60);

      /// Add Header Accepted
      options.headers.addAll({
        Headers.acceptHeader: applicationJson,
        Headers.contentTypeHeader: applicationJson,
      });

      handler.next(options);
    }
    return options;
  }
}
