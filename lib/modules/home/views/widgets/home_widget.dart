import 'package:animate_do/animate_do.dart';
import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weathapp/core/config/theme/app_colors.dart';
import 'package:weathapp/core/config/theme/size.dart';
import 'package:weathapp/modules/home/bloc/weather_bloc.dart';
import 'package:weathapp/modules/home/views/widgets/forecast_item.dart';
import 'package:weathapp/modules/home/views/widgets/search_dialog.dart';
import 'package:weathapp/modules/home/views/widgets/weather_item.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key, required this.state});

  final WeatherState state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: designPadding24,
                vertical: designPaddingCenter,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  designPadding24.ph,
                  FadeInUp(
                    from: 20,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.location_on_outlined),
                          onPressed: () async {
                            context.read<WeatherBloc>()
                              ..add(GetWeatherEvent())
                              ..add(GetWeatherListEvent());
                          },
                        ),
                        const Spacer(),
                        Text(
                          state.weather?.name ?? 'City',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.search_rounded),
                          onPressed: () {
                            showDialog(
                              context: context,
                              useRootNavigator: true,
                              builder: (ctx) {
                                return SearchDialog(ctx: context);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  designPadding24.ph,
                  FadeInUp(
                    from: 40,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: designPaddingCenter,
                          vertical: designPaddingCenter,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius:
                              BorderRadius.circular(designRoundedRadius),
                        ),
                        child: Text(
                          DateFormat.yMMMMd().format(DateTime.now()),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: AppColor.backgroundColor,
                                  fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  designPadding12.ph,
                  FadeInUp(
                    from: 60,
                    child: Center(
                      child: Text(
                        state.weather?.weather?.first.main ?? '',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
                  designPadding12.ph,
                  FadeInUp(
                    from: 80,
                    child: Center(
                      child: Text(
                        "${state.weather?.main?.temp?.toInt().toString()}°",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 184),
                      ),
                    ),
                  ),
                  designPadding12.ph,
                  FadeInUp(
                    from: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daily summary',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        designPaddingCenter.ph,
                        Text(
                          'Now it feels like ${state.weather?.main?.feelsLike?.toInt().toString()}° actually ${state.weather?.main?.temp?.toInt().toString()}°.',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'The temperature is felt in the range of ${state.weather?.main?.tempMin?.toInt().toString()}° to ${state.weather?.main?.tempMax?.toInt().toString()}°.',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  designPadding24.ph,
                  FadeInUp(
                    from: 120,
                    child: Container(
                      padding: EdgeInsets.all(designPadding24),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(designRadius18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WeatherItem(
                            icon: Icons.waves_rounded,
                            title: 'Wind',
                            value: '${state.weather?.wind?.speed} km/h',
                          ),
                          WeatherItem(
                            icon: Icons.water_drop,
                            title: 'Humidity',
                            value: '${state.weather?.main?.humidity}%',
                          ),
                          WeatherItem(
                            icon: Icons.remove_red_eye_outlined,
                            title: 'visibility',
                            value:
                                '${((state.weather?.visibility ?? 1000) / 1000).toString()} km',
                          ),
                        ],
                      ),
                    ),
                  ),
                  designPadding24.ph,
                ],
              ),
            ),
            FadeInUp(
              from: 140,
              child: Row(
                children: [
                  designPadding24.pw,
                  Text(
                    'Weekly forecast',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_rounded),
                  designPadding24.pw,
                ],
              ),
            ),
            designPadding24.ph,
            FadeInUp(
              from: 160,
              child: SizedBox(
                height: 125,
                child: ListView.separated(
                  itemCount: state.weatherList?.length ?? 0,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => designPadding12.pw,
                  itemBuilder: (context, index) {
                    return ForecastItem(
                      index: index,
                      weatherList: state.weatherList ?? [],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
