import 'package:food_delivery_app/utils/utils.dart';

class RestaurantModel {
  final int id;
  final String name;
  final double rate;
  final int estimatedMinutes;
  final double deliveryPrice;
  final List<String> foods;
  final String introImage;
  final bool open;

  const RestaurantModel({
    required this.id,
    required this.name,
    required this.rate,
    required this.estimatedMinutes,
    required this.deliveryPrice,
    required this.foods,
    required this.introImage,
    required this.open,
  });

  RestaurantModel.fromJson(JsonType data)
      : id = data["id"],
        name = data["name"],
        rate = data["rate"],
        estimatedMinutes = data["estimated_minutes"],
        deliveryPrice = data["delivery_price"],
        foods = data["foods"],
        introImage = data["intro_image"],
        open = data["op"];
}
