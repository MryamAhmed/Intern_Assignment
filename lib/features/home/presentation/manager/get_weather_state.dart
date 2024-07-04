part of 'get_weather_cubit.dart';

@immutable
abstract class GetWeatherState {}

class GetWeatherInitial extends GetWeatherState {}

class WeatherLoadingState extends GetWeatherState {}

class WeatherSuccessState extends GetWeatherState {
  WeatherModel weatherModel;
  WeatherSuccessState({required this.weatherModel});
}

class WeatherFailureState extends GetWeatherState {
  String error;

  WeatherFailureState({required this.error});
}

class WeatherNullState extends GetWeatherState {
  String Message;

  WeatherNullState({required this.Message});
}
