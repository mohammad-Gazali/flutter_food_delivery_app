import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/utils/app_types.dart';

class FoodModel {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final List<String>? sizes;
  final RestaurantModel restaurant;
  final double price;

  // TODO: convert this attribute to CategoryModel type
  final String category;

  const FoodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.sizes,
    required this.restaurant,
    required this.price,
    required this.category,
  });

  FoodModel.fromJson(JsonType data)
      : id = data["id"],
        name = data["name"],
        description = data["description"],
        imageUrl = data["image_url"],
        sizes = data["sizes"],
        restaurant = RestaurantModel.fromJson(data["restaurant"]),
        price = data["price"],
        // TODO: if you changed category type use CategoryModel.fromJson constructor here
        category = data["category"];
}
