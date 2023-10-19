import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Ios Back Button
class IosBackButton extends StatelessWidget {
  /// Constructor. This is a const constructor so that it can be used in
  const IosBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.pop();
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }
}
