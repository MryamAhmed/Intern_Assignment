import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern/features/home/presentation/view/home_view.dart';

import 'core/cash_helper.dart';
import 'core/utils/api.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/manager/get_weather_cubit.dart';

void main() async {
  await CasheHelper.init();
  runApp(BlocProvider(
      create: (BuildContext context) {
        return GetWeatherCubit(HomeRepoImpl(ApiService(Dio())));
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
