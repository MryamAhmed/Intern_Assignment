import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern/features/home/presentation/view/widgets/home_view_body.dart';

import '../../../searsh/search_view.dart';
import '../manager/get_weather_cubit.dart';
import 'widgets/faield_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    String? cityFromCash =
        BlocProvider.of<GetWeatherCubit>(context).getCity('city');
    BlocProvider.of<GetWeatherCubit>(context)
        .getWeather(cityName: cityFromCash);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff00007C),
          title: const Text(
            'WEATHER APP',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchView()),
                );
              },
              icon: const Icon(
                Icons.search_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
            builder: (context, state) {
          if (state is WeatherSuccessState) {
            return HomeViewBody(model: state.weatherModel);
          } else if (state is WeatherFailureState) {
            return Center(
                child: faieldBody(
              errorMessage: state.error,
            ));
          } else if (state is WeatherLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(
                child: Text(
              'there is no weather 😔 start search ',
              style: TextStyle(fontSize: 20),
            ));
          }
        }));
  }
}
