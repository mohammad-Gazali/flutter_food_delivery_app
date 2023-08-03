import 'package:food_delivery_app/utils/utils.dart';

class RestaurantModel {
  final int id;
  final String name;
  final double rate;
  final int estimatedMinutes;
  final bool freeDelivery;
  final List<String> foods;
  final bool open;

  const RestaurantModel({
    required this.id,
    required this.name,
    required this.rate,
    required this.estimatedMinutes,
    required this.freeDelivery,
    required this.foods,
    required this.open,
  });

  RestaurantModel.fromJson(JsonType data)
      : id = data["id"],
        name = data["name"],
        rate = data["rate"],
        estimatedMinutes = data["estimated_minutes"],
        freeDelivery = data["free_delivery"],
        foods = data["foods"],
        open = data["op"];
}
