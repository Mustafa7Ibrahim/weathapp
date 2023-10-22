import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathapp/core/config/theme/app_colors.dart';
import 'package:weathapp/core/config/theme/size.dart';
import 'package:weathapp/modules/home/bloc/weather_bloc.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({super.key, required this.ctx});

  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(designRadius18),
      ),
      titleTextStyle: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(fontWeight: FontWeight.bold, color: AppColor.primaryColor),
      title: const Text('Search'),
      content: TextField(
        decoration: InputDecoration(
          hintText: 'Enter city name ("cairo")',
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(designRadius18),
            ),
            borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(designRadius18),
            ),
            borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
          ),
        ),
        keyboardType: TextInputType.text,
        maxLines: 1,
        textAlign: TextAlign.center,
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {
          ctx
              .read<WeatherBloc>()
              .add(GetWeatherEvent(city: value, needLocation: false));

          Navigator.pop(context);
        },
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(
            left: designPadding12,
            right: designPadding12,
            bottom: designPadding12,
          ),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ),
      ],
    );
  }
}
