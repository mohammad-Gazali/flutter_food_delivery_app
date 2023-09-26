import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/utils/app_colors.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(restaurant.introImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            restaurant.name,
            style: const TextStyle(
              color: Color(0xFF181C2E),
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            restaurant.foods.join(" - "),
            style: const TextStyle(
              color: Color(0xFFA0A5BA),
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.star_border,
                color: AppColors.primary,
              ),
              Text(
                " ${restaurant.rate}",
                style: const TextStyle(
                  color: Color(0xFF181C2E),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.local_shipping_outlined,
                color: AppColors.primary,
              ),
              if (restaurant.deliveryPrice == 0)
                const Text(
                  " Free",
                  style: TextStyle(
                    color: Color(0xFF181C2E),
                    fontSize: 14,
                  ),
                )
              else
                Text(
                  " \$${restaurant.deliveryPrice.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Color(0xFF181C2E),
                    fontSize: 14,
                  ),
                ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.access_time,
                color: AppColors.primary,
              ),
              Text(
                " ${restaurant.estimatedMinutes} min",
                style: const TextStyle(
                  color: Color(0xFF181C2E),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
