import 'package:flutter/material.dart';

class ErrorPlacehoder extends StatelessWidget {
  const ErrorPlacehoder({super.key, this.msg, this.onRetry});
  final String? msg;
  final VoidCallback? onRetry;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(msg ?? 'An error occurred while loading files.'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onRetry,
          child: const Text('Retry'),
        ),
      ],
    ));
  }
}
