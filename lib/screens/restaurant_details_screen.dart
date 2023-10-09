import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  final RestaurantModel restaurant;

  const RestaurantDetailsScreen({super.key, required this.restaurant});

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  int _activeCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            // app bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 18,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22.5),
                      child: Material(
                        color: const Color(0xFFECF0F4),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Color(0xFF181C2E),
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    'Restaurant View',
                    style: TextStyle(
                      color: Color(0xFF181C2E),
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22.5),
                      child: Material(
                        color: const Color(0xFFECF0F4),
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.more_horiz_rounded,
                            color: Color(0xFF181C2E),
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            Container(
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 28),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                image: DecorationImage(
                  image: NetworkImage(widget.restaurant.introImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(
              height: 26,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                widget.restaurant.name,
                style: const TextStyle(
                  color: Color(0xFF181C2E),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                widget.restaurant.description,
                style: const TextStyle(
                  color: Color(0xFFA0A5BA),
                  fontSize: 14,
                ),
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                children: [
                  const Icon(
                    Icons.star_border,
                    color: AppColors.primary,
                  ),
                  Text(
                    " ${widget.restaurant.rate}",
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
                  if (widget.restaurant.deliveryPrice == 0)
                    const Text(
                      " Free",
                      style: TextStyle(
                        color: Color(0xFF181C2E),
                        fontSize: 14,
                      ),
                    )
                  else
                    Text(
                      " \$${widget.restaurant.deliveryPrice.toStringAsFixed(2)}",
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
                    " ${widget.restaurant.estimatedMinutes} min",
                    style: const TextStyle(
                      color: Color(0xFF181C2E),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 52,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.restaurant.categories.length,
                itemBuilder: (context, index) {
                  final category = widget.restaurant.categories[index];
                  final isActive = index == _activeCategoryIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _activeCategoryIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isActive ? const Color(0xFFF58D1D) : null,
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          width: 2,
                          color: isActive
                              ? const Color(0xFFF58D1D)
                              : const Color(0xFFEDEDED),
                        ),
                      ),
                      margin: EdgeInsets.only(
                        left: index == 0 ? 28 : 12,
                        right: index == widget.restaurant.categories.length - 1
                            ? 28
                            : 0,
                      ),
                      child: Center(
                        child: Text(
                          category.name,
                          style: TextStyle(
                            color: isActive
                                ? Colors.white
                                : const Color(0xFF181C2E),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(
              height: 32,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                "${widget.restaurant.categories[_activeCategoryIndex].name} (${widget.restaurant.foods.where((food) => food.category?.id == widget.restaurant.categories[_activeCategoryIndex].id).length})",
                style: const TextStyle(
                  color: Color(0xFF181C2E),
                  fontSize: 20,
                ),
              ),
            ),
          
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.9,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: widget.restaurant.foods
                  .where((r) => r.category!.id == widget.restaurant.categories[_activeCategoryIndex].id)
                  .map(
                    (r) => PopularFoodCard(
                      popularFood: r,
                      restaurantName: widget.restaurant.name,
                      withPrice: true,
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 32,),
          ],
        ),
      ),
    );
  }
}
