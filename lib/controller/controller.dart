part of weather_app;

final weatherServiceProvider =
    Provider((ref) => WeatherService(ref.watch(Provider((ref) => Dio()))));

final locationNameProvider = StateProvider<String>((ref) => "");

final weatherDataProvider =
    FutureProvider.family<WeatherData, String>((ref, locationName) async {
  final weatherService = ref.watch(weatherServiceProvider);
  final response = await weatherService.getWeatherData(locationName);

  if (response.success == "true") {
    return WeatherData.fromJson(
        response.records ?? {}); //沒有records 資料的話 直接回空 物件
  } else {
    throw Exception('Failed to load weather data');
  }
});
