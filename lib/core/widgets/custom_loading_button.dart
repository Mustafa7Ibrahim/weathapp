import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weathapp/core/config/theme/app_colors.dart';

/// This class is used to show a custom loading button.
/// It is used to show a loading button with a custom text.
class CustomLoadingButton extends HookWidget {
  /// Default constructor.
  const CustomLoadingButton({
    required this.isEnabled,
    required this.onPressed,
    required this.text,
    required this.isLoading,
    this.color,
    super.key,
  });

  /// The function to be called when the button is pressed.
  final VoidCallback? onPressed;

  /// The text to be shown on the button.
  final String text;

  /// The loading state of the button.
  final ValueNotifier<bool> isLoading;

  /// button enabled state
  final ValueNotifier<bool> isEnabled;

  /// final color of the button
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final showLoading = isLoading;
    return ElevatedButton(
      onPressed: isEnabled.value == false ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColor.primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: showLoading.value ? 20 : 0,
                width: showLoading.value ? 20 : 0,
                child: CircularProgressIndicator(
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: showLoading.value ? 2 : 0,
                ),
              ),
              if (showLoading.value) 12.pw else 0.pw,
            ],
          ),
          Text(text),
        ],
      ),
    );
  }
}
