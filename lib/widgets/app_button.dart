import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final Widget? endIcon;
  final double iconSpace;
  final double fontSize;

  const AppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.endIcon,
    this.iconSpace = 12,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          color: AppColors.primary,
          elevation: 10,
          textStyle: GoogleFonts.sen(
            color: AppColors.primaryContent,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: fontSize),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text.toUpperCase()),
                  if (endIcon != null) ...[
                    SizedBox(width: iconSpace),
                    endIcon!,
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
