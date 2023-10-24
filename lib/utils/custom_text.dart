import 'package:flutter/material.dart';

class CustomTextWithStyle extends StatelessWidget {
  final String value;
  const CustomTextWithStyle({
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: const TextStyle(color: Colors.white),
    );
  }
}
