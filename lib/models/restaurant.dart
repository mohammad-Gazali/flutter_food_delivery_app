import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/utils/utils.dart';

class RestaurantModel {
  final int id;
  final String name;
  final String description;
  final double rate;
  final int estimatedMinutes;
  final double deliveryPrice;
  final String introImage;
  final List<FoodModel> foods;
  final List<CategoryModel> categories;
  final bool open;

  const RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.rate,
    required this.estimatedMinutes,
    required this.deliveryPrice,
    required this.foods,
    required this.introImage,
    required this.categories,
    required this.open,
  });

  RestaurantModel.fromJson(JsonType data)
      : id = data["id"],
        name = data["name"],
        description = data["description"],
        rate = data["rate"],
        estimatedMinutes = data["estimated_minutes"],
        deliveryPrice = data["delivery_price"],
        foods = data["foods"].map((food) => FoodModel.fromJson(food)).toList(),
        introImage = data["intro_image"],
        categories = data["categories"].map((food) => CategoryModel.fromJson(food)).toList(),
        open = data["open"];
}
