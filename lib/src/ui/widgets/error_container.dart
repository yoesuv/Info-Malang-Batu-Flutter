import 'package:flutter/material.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({super.key, this.title, this.onPress});

  final String? title;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 64),
          const SizedBox(height: 8),
          Text(
            title ?? '',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onPress,
            child: const Text('Try Again', style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
