import 'dart:developer';

import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weathapp/core/config/routes/routes_config.dart';
import 'package:weathapp/core/config/theme/size.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<(Failure?, Position?)> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    final isEnabled = await Geolocator.openLocationSettings();
    if (!isEnabled) {
      return (
        const ServerError(
          message: 'Location services are disabled.',
          statusCode: 500,
        ),
        null
      );
    }
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      final isEnabled = await Geolocator.openAppSettings();
      log('isEnabled: $isEnabled');
      if (!isEnabled) {
        return (
          const ServerError(
            message: 'Location services are disabled.',
            statusCode: 500,
          ),
          null
        );
      }
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    await customDialogWithReturn(
      title: 'Location services are disabled.',
      message: 'Please enable location permeation to located the'
          ' nearest pharmacies to you.',
      onOk: () async {
        final r = await Geolocator.openAppSettings();
        log('r: $r');
        if (r) {
          await determinePosition();
        }
      },
      okText: 'Enable',
    );
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return (null, await Geolocator.getCurrentPosition());
}

/// Shows a [Dialog] with [message].
Future<void> customDialogWithReturn({
  required String title,
  required String message,
  required VoidCallback onOk,
  required String okText,
}) {
  return showDialog<void>(
    context: globalContext!,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(designRadius8),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                height: 1.4,
              ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.4,
                  ),
            ),
            designPadding.ph,
            ElevatedButton(
              onPressed: () => onOk(),
              child: Text(okText),
            ),
          ],
        ),
      );
    },
  );
}
