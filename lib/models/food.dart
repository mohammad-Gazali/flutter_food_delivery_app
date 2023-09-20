import 'package:food_delivery_app/utils/app_types.dart';

class FoodModel {
  final int id;
  final String name;
  final String imageUrl;
  final String restaurant;
  final double price;

  // TODO: convert this attribute to CategoryModel type
  final String category;

  const FoodModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.restaurant,
    required this.price,
    required this.category,
  });

  FoodModel.fromJson(JsonType data)
      : id = data["id"],
        name = data["name"],
        imageUrl = data["image_url"],
        restaurant = data["restaurant"],
        price = data["price"],
        // TODO: if you changed category type use CategoryModel.fromJson constructor here
        category = data["category"];
}
