import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';

class AppIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onTap;

  const AppIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: AppColors.primary,
        elevation: 10,
        child: InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(4.0),
            child: icon,
          ),
        ),
      ),
    );
  }
}
