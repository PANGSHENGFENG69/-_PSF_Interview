part of 'index.dart';

@JsonSerializable(nullable: true)
class WeatherDataRequest {
  @override
  Map<String, dynamic> toJson() => _$WeatherDataRequestToJson(this);
  String? location;

  WeatherDataRequest({
    this.location,
  });
}
