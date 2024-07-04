import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/presentation/manager/get_weather_cubit.dart';

class SearchViewBody extends StatelessWidget {
  SearchViewBody({Key? key}) : super(key: key);
  String? city_name;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                BlocProvider.of<GetWeatherCubit>(context)
                    .saveCity('city', city_name);
                Navigator.pop(context);
                String? cityFromCash =
                    BlocProvider.of<GetWeatherCubit>(context).getCity('city');
                BlocProvider.of<GetWeatherCubit>(context)
                    .getWeather(cityName: cityFromCash);
              },
              icon: const Icon(
                Icons.search_outlined,
                color: Color(0xff00007C),
              ),
            ),
            hintText: "Enter City Name...",
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.grey,
            )),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.grey,
            )),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xff00007C),
            )),
          ),
          onChanged: (data) {
            city_name = data;
          },
        ),
      ),
    );
  }
}
