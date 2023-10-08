import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/utils/app_types.dart';

class FoodModel {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final List<String>? sizes;
  final RestaurantModel? restaurant;
  final CategoryModel? category;
  final double price;

  const FoodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.sizes,
    required this.price,
    this.restaurant,
    this.category,
  });

  FoodModel.fromJson(JsonType data)
      : id = data["id"],
        name = data["name"],
        description = data["description"],
        imageUrl = data["image_url"],
        sizes = data["sizes"],
        restaurant = data.containsKey("restaurant") && data["restaurant"] != null ? RestaurantModel.fromJson(data["restaurant"]) : null,
        price = data["price"],
        category = data.containsKey("restaurant") && data["restaurant"] != null ? CategoryModel.fromJson(data["category"]) : null;
}
