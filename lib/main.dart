import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/screens.dart';
import 'package:food_delivery_app/models/models.dart';
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
      home: const FoodDetailsScreen(
        food: FoodModel(
          id: 1,
          category: "Fast Food",
          imageUrl: "https://placehold.co/122x84/png",
          name: "Fire Burger",
          description: "Prosciutto e funghi is a pizza variety that is topped with tomato sauce.",
          price: 30,
          restaurant: RestaurantModel(id: 1, name: "Macdonald", rate: 4.7, estimatedMinutes: 20, deliveryPrice: 10, foods: [], introImage: "", open: true),
          sizes: ["10”", "14”", "16”"],
        ),
      ),
    );
  }
}
