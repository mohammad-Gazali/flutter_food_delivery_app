import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/category.dart';
import 'package:food_delivery_app/screens/screens.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.sen().fontFamily,
      ),
      home: const CategoryScreen(
        category: CategoryModel(
          id: 1,
          name: "Burger",
          imageUrl: "https://placehold.co/44/png",
        ),
      ),
    );
  }
}
