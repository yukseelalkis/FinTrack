import 'package:flutter/material.dart';

class CustomGestureText extends StatelessWidget {
  final String text;
  final VoidCallback onTapCallback;
  final TextStyle? style;

  const CustomGestureText({
    super.key, // ✅ kısa ve önerilen kullanım
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
