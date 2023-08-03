import 'package:food_delivery_app/utils/utils.dart';

class CategoryModel {
  final int id;
  final String name;
  final String imageUrl;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  CategoryModel.fromJson(JsonType data)
      : id = data["id"],
        name = data["name"],
        imageUrl = data["image_url"];
}
