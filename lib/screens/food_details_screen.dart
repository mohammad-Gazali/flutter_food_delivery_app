import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

class FoodDetailsScreen extends StatefulWidget {
  final FoodModel food;

  const FoodDetailsScreen({super.key, required this.food});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  int _activeSizeIndex = 0;
  int _numberOfFood = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
            height: 184,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 28,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFF0F5FA),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.food.price * _numberOfFood}",
                      style: const TextStyle(
                        color: Color(0xFF181C2E),
                        fontSize: 28,
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 125,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF121223),
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              if (_numberOfFood > 1) {
                                setState(() {
                                  _numberOfFood--;
                                });
                              }
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: Color(0xFF41414F),
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: const Icon(Icons.remove, color: Colors.white),
                            ),
                          ),
                          Text(
                            _numberOfFood.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _numberOfFood++;
                              });
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: Color(0xFF41414F),
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: const Icon(Icons.add, color: Colors.white,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                AppButton(onTap: () {}, text: "Add to cart"),
                const SizedBox(height: 12,),
              ],
            ),
          );
        },
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          children: [
            const SizedBox(
              height: 18,
            ),

            // app bar
            Row(
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
                  'Details',
                  style: TextStyle(
                    color: Color(0xFF181C2E),
                    fontSize: 17,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 42,
            ),

            Stack(
              children: [
                Container(
                  height: 184,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    image: DecorationImage(
                      image: NetworkImage(widget.food.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22.5),
                      child: Material(
                        color: const Color(0xFFC5C5C5),
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 26,
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFECF0F4),
                    ),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset("assets/restaurant_icon.png"),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.food.restaurant!.name,
                          style: const TextStyle(
                            color: Color(0xFF181C2E),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 26,
            ),

            Text(
              widget.food.name,
              style: const TextStyle(
                color: Color(0xFF181C2E),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            Text(
              widget.food.description,
              style: const TextStyle(
                color: Color(0xFFA0A5BA),
                fontSize: 14,
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            Row(
              children: [
                const Icon(
                  Icons.star_border,
                  color: AppColors.primary,
                ),
                Text(
                  " ${widget.food.restaurant!.rate}",
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
                if (widget.food.restaurant!.deliveryPrice == 0)
                  const Text(
                    " Free",
                    style: TextStyle(
                      color: Color(0xFF181C2E),
                      fontSize: 14,
                    ),
                  )
                else
                  Text(
                    " \$${widget.food.restaurant!.deliveryPrice.toStringAsFixed(2)}",
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
                  " ${widget.food.restaurant!.estimatedMinutes} min",
                  style: const TextStyle(
                    color: Color(0xFF181C2E),
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 18,
            ),

            Row(
              children: [
                const Text(
                  "SIZE:",
                  style: TextStyle(
                    color: Color(0xFF32343E),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                if (widget.food.sizes != null)
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 16,
                        children: widget.food.sizes!.asMap().entries.map(
                          (size) {
                            final isActive = size.key == _activeSizeIndex;
                            final bigLettersSize = size.value.length > 3;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _activeSizeIndex = size.key;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  shape: bigLettersSize
                                      ? BoxShape.rectangle
                                      : BoxShape.circle,
                                  borderRadius: bigLettersSize
                                      ? BorderRadius.circular(36)
                                      : null,
                                  color: isActive
                                      ? const Color(0xFFF58D1D)
                                      : const Color(0xFFF0F5FA),
                                ),
                                child: Text(
                                  size.value,
                                  style: TextStyle(
                                    color: isActive
                                        ? Colors.white
                                        : const Color(0xFF121223),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(
              height: 216,
            ),
          ],
        ),
      ),
    );
  }
}
