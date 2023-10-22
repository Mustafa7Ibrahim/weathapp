import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weathapp/core/config/theme/app_colors.dart';
import 'package:weathapp/core/dependency_injection/get_it.dart';
import 'package:weathapp/modules/home/bloc/weather_bloc.dart';
import 'package:weathapp/modules/home/views/widgets/home_shimmer.dart';
import 'package:weathapp/modules/home/views/widgets/home_widget.dart';

class HomeView extends HookWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => gi<WeatherBloc>()..add(GetWeatherEvent()),
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state.status == WeatherStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColor.primaryColor,
                  content: Text(
                    state.error ?? '',
                    style: TextStyle(color: AppColor.backgroundColor),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.status == WeatherStatus.loading) {
              return const HomeShimmer();
            }

            return HomeWidget(state: state);
          },
        ),
      ),
    );
  }
}
