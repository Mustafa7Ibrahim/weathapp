import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:weathapp/core/interceptors/dio_interceptor.dart';

/// Handle Http Request
class DioHelper {
  /// DioHelper constructor
  DioHelper(this.dio);

  final Dio dio;

  /// init dio
  Dio init() {
    dio.interceptors.addAll([
      AppInterceptors(dio),
      TalkerDioLogger(),
    ]);

    return dio;
  }
}
