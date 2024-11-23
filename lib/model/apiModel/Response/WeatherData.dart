part of 'index.dart';

@JsonSerializable()
class WeatherResponse {
  String? success;
  Map<String, dynamic>? records;

  WeatherResponse({this.success, this.records});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}

@JsonSerializable()
class WeatherData {
  String? datasetDescription;
  List<LocationData>? location;

  WeatherData({this.datasetDescription, this.location});

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}

@JsonSerializable()
class LocationData {
  String? locationName;
  List<WeatherElement>? weatherElement;

  LocationData({this.locationName, this.weatherElement});

  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);
  Map<String, dynamic> toJson() => _$LocationDataToJson(this);
}

@JsonSerializable()
class WeatherElement {
  String? elementName;
  List<WeatherElementTime>? time;

  WeatherElement({this.elementName, this.time});

  factory WeatherElement.fromJson(Map<String, dynamic> json) =>
      _$WeatherElementFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherElementToJson(this);
}

@JsonSerializable()
class WeatherElementTime {
  String? startTime;
  String? endTime;
  WeatherElementParameter? parameter;

  WeatherElementTime({this.startTime, this.endTime, this.parameter});

  factory WeatherElementTime.fromJson(Map<String, dynamic> json) =>
      _$WeatherElementTimeFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherElementTimeToJson(this);
}

@JsonSerializable()
class WeatherElementParameter {
  String? parameterName;
  String? parameterValue;
  String? parameterUnit;

  WeatherElementParameter(
      {this.parameterName, this.parameterValue, this.parameterUnit});

  factory WeatherElementParameter.fromJson(Map<String, dynamic> json) =>
      _$WeatherElementParameterFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherElementParameterToJson(this);
}
