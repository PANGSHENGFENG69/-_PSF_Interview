// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      success: json['success'] as String?,
      records: json['records'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'records': instance.records,
    };

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      datasetDescription: json['datasetDescription'] as String?,
      location: (json['location'] as List<dynamic>?)
          ?.map((e) => LocationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'datasetDescription': instance.datasetDescription,
      'location': instance.location,
    };

LocationData _$LocationDataFromJson(Map<String, dynamic> json) => LocationData(
      locationName: json['locationName'] as String?,
      weatherElement: (json['weatherElement'] as List<dynamic>?)
          ?.map((e) => WeatherElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationDataToJson(LocationData instance) =>
    <String, dynamic>{
      'locationName': instance.locationName,
      'weatherElement': instance.weatherElement,
    };

WeatherElement _$WeatherElementFromJson(Map<String, dynamic> json) =>
    WeatherElement(
      elementName: json['elementName'] as String?,
      time: (json['time'] as List<dynamic>?)
          ?.map((e) => WeatherElementTime.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherElementToJson(WeatherElement instance) =>
    <String, dynamic>{
      'elementName': instance.elementName,
      'time': instance.time,
    };

WeatherElementTime _$WeatherElementTimeFromJson(Map<String, dynamic> json) =>
    WeatherElementTime(
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      parameter: json['parameter'] == null
          ? null
          : WeatherElementParameter.fromJson(
              json['parameter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherElementTimeToJson(WeatherElementTime instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'parameter': instance.parameter,
    };

WeatherElementParameter _$WeatherElementParameterFromJson(
        Map<String, dynamic> json) =>
    WeatherElementParameter(
      parameterName: json['parameterName'] as String?,
      parameterValue: json['parameterValue'] as String?,
      parameterUnit: json['parameterUnit'] as String?,
    );

Map<String, dynamic> _$WeatherElementParameterToJson(
        WeatherElementParameter instance) =>
    <String, dynamic>{
      'parameterName': instance.parameterName,
      'parameterValue': instance.parameterValue,
      'parameterUnit': instance.parameterUnit,
    };
