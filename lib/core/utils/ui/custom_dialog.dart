import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:weathapp/core/config/routes/routes_config.dart';
import 'package:weathapp/core/config/theme/app_colors.dart';
import 'package:weathapp/core/config/theme/size.dart';

/// Shows a [Dialog] with [message].
Future<bool?> customDialog({
  required String title,
  required String message,
  required VoidCallback onOk,
  required String okText,
  bool optionDialog = false,
  bool isPrimary = false,
}) {
  return showDialog<bool?>(
    context: globalContext!,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(designRadius18),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    height: 1.4,
                  ),
              textAlign: TextAlign.center,
            ),
            designPaddingCenter.ph,
            Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(height: 1.4, color: AppColor.backgroundColor),
              textAlign: TextAlign.center,
            ),
            designPadding12.ph,
            Row(
              children: [
                Flexible(
                  child: ElevatedButton(
                    onPressed: onOk,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPrimary
                          ? AppColor.primaryColor
                          : AppColor.backgroundColor,
                    ),
                    child: Text(okText),
                  ),
                ),
                if (optionDialog) designPaddingCenter.pw,
                if (optionDialog)
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.backgroundColor,
                      ),
                      child: const Text("Cancel"),
                    ),
                  ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
