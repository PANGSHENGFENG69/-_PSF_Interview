part of weather_app;

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  Future<WeatherResponse> getWeatherData(String locationName) async {
    final String apiUrl =
        "https://opendata.cwa.gov.tw/api/v1/rest/datastore/F-C0032-001";
    final String authorization = "CWA-AA7AA611-3FB6-43B5-9A78-1E7665D8BE5B";

    try {
      final response = await dio.get(apiUrl, queryParameters: {
        'Authorization': authorization,
        'locationName': locationName,
      });

      return WeatherResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to load weather data: $e");
    }
  }
}
