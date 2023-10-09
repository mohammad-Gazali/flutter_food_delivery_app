import 'package:flutter/material.dart';

class AppTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String hintText;
  final TextInputType type;
  final bool isPassword;

  const AppTextInput({
    super.key,
    required this.controller,
    required this.hintText,
    this.type = TextInputType.text,
    this.isPassword = false,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Text(
              label!.toUpperCase(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
          TextField(
            onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
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
      ),
    );
  }
}
