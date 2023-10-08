import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/screens.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

final _random = Random();

final _fakeCategories = List.generate(
  6,
  (index) => CategoryModel(
    id: index,
    name: "Test${index + 1}",
    imageUrl: "https://placehold.co/44/png",
  ),
);

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
      home: RestaurantDetailsScreen(
        restaurant: RestaurantModel(
          id: 1,
          introImage: "https://placehold.co/400x200/png",
          name: "Spicy Restaurant",
          description:
              "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
          rate: 4.7,
          estimatedMinutes: 20,
          deliveryPrice: 10,
          open: true,
          categories: _fakeCategories,
          foods: List.generate(
            15,
            (index) {
              return FoodModel(
                id: index,
                name: 'Food Name ${index + 1}',
                description:
                    'Prosciutto e funghi is a pizza variety that is topped with tomato sauce.',
                imageUrl: 'https://placehold.co/122x84/png',
                price: 29.99,
                category: _fakeCategories[_random.nextInt(_fakeCategories.length)],
                sizes: [],
              );
            },
          ),
        ),
      ),
    );
  }
}
