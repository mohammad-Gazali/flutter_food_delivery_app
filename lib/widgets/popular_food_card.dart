import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

class PopularFoodCard extends StatelessWidget {
  final FoodModel popularFood;
  final bool withPrice;

  const PopularFoodCard({
    super.key,
    required this.popularFood,
    this.withPrice = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 84,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(popularFood.imageUrl), fit: BoxFit.cover),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(25)),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Text(
                  popularFood.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Color(0xFF32343E),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,  
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Text(
                  popularFood.restaurant,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF646982),
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
          if (withPrice) ...[
            const SizedBox(
              height: 6,
            ),
            const Spacer(),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "${popularFood.price}\$",
                  style: const TextStyle(
                    color: Color(0xFF32343E),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                AppIconButton(
                  onTap: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
          ]
        ],
      ),
    );
  }
}
