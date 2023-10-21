part of 'weather_bloc.dart';

final class WeatherState {
  final WeatherStatus status;
  final WeatherModel? weather;
  final List<ListElement>? weatherList;
  final String? error;

  const WeatherState({
    this.status = WeatherStatus.loading,
    this.weather,
    this.weatherList,
    this.error,
  });

  WeatherState copyWith({
    WeatherStatus? status,
    WeatherModel? weather,
    List<ListElement>? weatherList,
    String? error,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      weatherList: weatherList ?? this.weatherList,
      error: error ?? this.error,
    );
  }
}

enum WeatherStatus { loading, success, failure }
