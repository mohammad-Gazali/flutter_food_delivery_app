import 'package:flutter/material.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      spacing: 32,
      children: [
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF395998),
          elevation: 0,
          focusElevation: 0,
          hoverElevation: 0,
          disabledElevation: 0,
          highlightElevation: 0,
          child: const Icon(Icons.facebook, color: Colors.white,),
        ),
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF7289DA),
          elevation: 0,
          focusElevation: 0,
          hoverElevation: 0,
          disabledElevation: 0,
          highlightElevation: 0,
          child: const Icon(Icons.discord, color: Colors.white,),
        ),
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF1B1F2F),
          elevation: 0,
          focusElevation: 0,
          hoverElevation: 0,
          disabledElevation: 0,
          highlightElevation: 0,
          child: const Icon(Icons.apple, color: Colors.white,),
        ),
      ],
    );
  }
}
