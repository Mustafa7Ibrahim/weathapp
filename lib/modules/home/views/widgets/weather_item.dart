import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:weathapp/core/config/theme/app_colors.dart';
import 'package:weathapp/core/config/theme/size.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: AppColor.backgroundColor,
          size: 44,
        ),
        designPadding12.ph,
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColor.backgroundColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        designPaddingCenter.ph,
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColor.backgroundColor,
                fontWeight: FontWeight.w300,
              ),
        ),
      ],
    );
  }
}
