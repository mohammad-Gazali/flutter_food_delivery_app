import 'package:flutter/material.dart';

class AppTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool isPassword;

  const AppTextInput({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 12,
        ),
        TextField(
          obscureText: isPassword,
          style: const TextStyle(
            color: Color(0xFF32343E),
            fontSize: 20,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF0F5FA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFFA0A5BA),
            ),
          ),
        ),
      ],
    );
  }
}
