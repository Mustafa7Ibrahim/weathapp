import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weathapp/modules/home/models/weather_model.dart';

part 'weather_list_model.g.dart';

@JsonSerializable()
class WeatherListModel extends Equatable {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<ListElement>? list;
  final City? city;

  const WeatherListModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  static List<ListElement> filterUniqueDates(List<ListElement> list) {
    List<ListElement>? newList = [];

    for (final element in list) {
      /// loop over the list and only return one item with the same date
      final isExist = newList.any(
        (e) => e.dtTxt?.day == element.dtTxt?.day,
      );

      if (!isExist) {
        newList.add(element);
      }
    }

    return newList;
  }

  WeatherListModel copyWith({
    String? cod,
    int? message,
    int? cnt,
    List<ListElement>? list,
    City? city,
  }) =>
      WeatherListModel(
        cod: cod ?? this.cod,
        message: message ?? this.message,
        cnt: cnt ?? this.cnt,
        list: list ?? this.list,
        city: city ?? this.city,
      );

  factory WeatherListModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherListModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherListModelToJson(this);

  @override
  List<Object?> get props => [cod, message, cnt, list, city];
}

@JsonSerializable()
class City extends Equatable {
  final int? id;
  final String? name;
  final Coord? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  const City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  City copyWith({
    int? id,
    String? name,
    Coord? coord,
    String? country,
    int? population,
    int? timezone,
    int? sunrise,
    int? sunset,
  }) =>
      City(
        id: id ?? this.id,
        name: name ?? this.name,
        coord: coord ?? this.coord,
        country: country ?? this.country,
        population: population ?? this.population,
        timezone: timezone ?? this.timezone,
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
      );

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        coord,
        country,
        population,
        timezone,
        sunrise,
        sunset,
      ];
}

@JsonSerializable()
class ListElement extends Equatable {
  final int? dt;
  final Main? main;
  final List<Weather>? weather;
  final Clouds? clouds;
  final Wind? wind;
  final int? visibility;
  final double? pop;
  final Sys? sys;
  final DateTime? dtTxt;

  const ListElement({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
  });

  ListElement copyWith({
    int? dt,
    Main? main,
    List<Weather>? weather,
    Clouds? clouds,
    Wind? wind,
    int? visibility,
    double? pop,
    Sys? sys,
    DateTime? dtTxt,
  }) =>
      ListElement(
        dt: dt ?? this.dt,
        main: main ?? this.main,
        weather: weather ?? this.weather,
        clouds: clouds ?? this.clouds,
        wind: wind ?? this.wind,
        visibility: visibility ?? this.visibility,
        pop: pop ?? this.pop,
        sys: sys ?? this.sys,
        dtTxt: dtTxt ?? this.dtTxt,
      );

  factory ListElement.fromJson(Map<String, dynamic> json) =>
      _$ListElementFromJson(json);

  Map<String, dynamic> toJson() => _$ListElementToJson(this);

  @override
  List<Object?> get props => [
        dt,
        main,
        weather,
        clouds,
        wind,
        visibility,
        pop,
        sys,
        dtTxt,
      ];
}

@JsonSerializable()
class Sys extends Equatable {
  final String? pod;

  Sys({
    required this.pod,
  });

  Sys copyWith({
    String? pod,
  }) =>
      Sys(
        pod: pod ?? this.pod,
      );

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);

  @override
  List<Object?> get props => [
        pod,
      ];
}
