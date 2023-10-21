import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weathapp/core/config/theme/app_colors.dart';
import 'package:weathapp/core/config/theme/size.dart';
import 'package:weathapp/modules/home/models/weather_list_model.dart';

class ForecastItem extends StatelessWidget {
  const ForecastItem({
    super.key,
    required this.index,
    required this.weatherList,
  });

  final int index;

  final List<ListElement>? weatherList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(
        left: index == 0 ? designPadding24 : 0,
        right: index == (weatherList?.length ?? 0) - 1 ? designPadding24 : 0,
      ),
      padding: EdgeInsets.all(designPadding12),
      decoration: BoxDecoration(
        color: AppColor.backgroundColor,
        border: Border.all(
          color: AppColor.primaryColor,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(designRadius18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${weatherList?[index].main?.temp?.toInt()}°",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          CachedNetworkImage(
            imageUrl:
                'https://openweathermap.org/img/wn/${weatherList?[index].weather?.first.icon}.png',
            imageBuilder: (context, imageProvider) => Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                ),
              ),
            ),
          ),
          Text(
            DateFormat('d MMM').format(
              weatherList?[index].dtTxt! ?? DateTime.now(),
            ),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
