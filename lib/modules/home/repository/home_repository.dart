import 'package:dio/dio.dart';
import 'package:easix/easix.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weathapp/modules/home/models/weather_list_model.dart';
import 'package:weathapp/modules/home/models/weather_model.dart';

class HomeRepository {
  HomeRepository({required this.dio});

  final Dio dio;

  /// get weather data from today
  Future<(Failure?, WeatherModel?)> getWeather({
    required double? lat,
    required double? lon,
    required String? city,
  }) async {
    try {
      final response = await dio.get(
        city == null
            ? "${dotenv.env['API_WEATHER']!}&lat=$lat&lon=$lon"
            : "${dotenv.env['API_WEATHER']!}&q=$city",
      );
      final weather = WeatherModel.fromJson(response.data);

      return (null, weather);
    } on DioException catch (e) {
      return (
        ServerError(
          message: e.response?.statusMessage ??
              "Unexpected error please try again later!",
          statusCode: e.response?.statusCode ?? 500,
        ),
        null
      );
    }
  }

  /// get weather data FOR 4 days
  Future<(Failure?, WeatherListModel?)> getWeatherFor5Days({
    required double? lat,
    required double? lon,
    required String? city,
  }) async {
    try {
      final response = await dio.get(
        city == null
            ? "${dotenv.env['API_FORECAST']!}&lat=$lat&lon=$lon"
            : "${dotenv.env['API_FORECAST']!}&q=$city",
      );
      final weather = WeatherListModel.fromJson(response.data);

      return (null, weather);
    } on DioException catch (e) {
      return (
        ServerError(
          message: e.response?.statusMessage ??
              "Unexpected error please try again later!",
          statusCode: e.response?.statusCode ?? 500,
        ),
        null
      );
    }
  }
}
