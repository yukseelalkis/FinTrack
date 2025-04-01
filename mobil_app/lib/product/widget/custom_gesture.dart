// disari cikabilir bakacaz
import 'package:flutter/material.dart';

class CustomGestureText extends StatelessWidget {
  final String text;
  final VoidCallback onTapCallback; // Callback metot
  final TextStyle? style;

  const CustomGestureText({
    required this.text,
    required this.onTapCallback,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Text(
        text,
        style: style ?? Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
