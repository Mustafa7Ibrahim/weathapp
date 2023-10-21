part of 'weather_bloc.dart';

sealed class WeatherEvent {}

/// get weather of today using lat and lon
class GetWeatherEvent extends WeatherEvent {
  final double? lat;
  final double? lon;
  final String? city;
  final bool needLocation;

  GetWeatherEvent({
    this.city,
    this.lat,
    this.lon,
    this.needLocation = true,
  });
}

/// get weather of 5 days using lat and lon
class GetWeatherListEvent extends WeatherEvent {
  final double? lat;
  final double? lon;
  final String? city;
  final bool needLocation;

  GetWeatherListEvent({
    this.city,
    this.lat,
    this.lon,
    this.needLocation = true,
  });
}
