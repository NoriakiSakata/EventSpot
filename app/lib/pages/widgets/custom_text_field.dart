import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.suffixIcon, this.maxLines});

  final Widget? suffixIcon;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder()),
    );
  }
}
