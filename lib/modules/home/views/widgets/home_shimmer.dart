import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weathapp/core/config/theme/app_colors.dart';
import 'package:weathapp/core/config/theme/size.dart';
import 'package:weathapp/modules/home/views/widgets/weather_item.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Shimmer.fromColors(
          baseColor: AppColor.primaryColor.withOpacity(0.4),
          highlightColor: AppColor.backgroundColor.withOpacity(0.7),
          period: const Duration(seconds: 2),
          enabled: true,
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
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.location_on_outlined),
                          onPressed: () {},
                        ),
                        const Spacer(),
                        Container(
                          width: 150,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius:
                                BorderRadius.circular(designRoundedRadius),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.search_rounded),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    designPadding24.ph,
                    Center(
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
                    designPadding12.ph,
                    Center(
                      child: Container(
                        width: 60,
                        height: 20,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius:
                              BorderRadius.circular(designRoundedRadius),
                        ),
                      ),
                    ),
                    designPadding12.ph,
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(designRadius18),
                      ),
                    ),
                    designPadding12.ph,
                    Text(
                      'Daily summary',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    designPaddingCenter.ph,
                    Container(
                      width: 150,
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius:
                            BorderRadius.circular(designRoundedRadius),
                      ),
                    ),
                    designPaddingCenter.ph,
                    Container(
                      width: 200,
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius:
                            BorderRadius.circular(designRoundedRadius),
                      ),
                    ),
                    designPadding24.ph,
                    Container(
                      padding: EdgeInsets.all(designPadding24),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(designRadius18),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WeatherItem(
                            icon: Icons.waves_rounded,
                            title: 'Wind',
                            value: '00 km/h',
                          ),
                          WeatherItem(
                            icon: Icons.water_drop,
                            title: 'Humidity',
                            value: '00%',
                          ),
                          WeatherItem(
                            icon: Icons.remove_red_eye_outlined,
                            title: 'visibility',
                            value: '00 km',
                          ),
                        ],
                      ),
                    ),
                    designPadding24.ph,
                  ],
                ),
              ),
              Row(
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
              designPadding24.ph,
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: designPadding24,
                  vertical: designPaddingCenter,
                ),
                height: 125,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(designPadding12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
