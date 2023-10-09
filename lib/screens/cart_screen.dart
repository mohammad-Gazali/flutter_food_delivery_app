import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/widgets/app_button.dart';
import 'package:food_delivery_app/widgets/app_text_input.dart';

final _fakeSelectedFoods = List.generate(2, (index) {
  return SelectedFoodModel(
    id: index,
    name: "Food Name ${index + 1}",
    imageUrl: "https://placehold.co/122x84/png",
    selectedSize: "14”",
    priceForOne: 35,
    quantity: 3,
  );
});

var _fakeSelectedFoodsSumPrice = 96;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isEdit = false;
  TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121223),
      bottomSheet: _bottomSheet(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          children: [
            _appBar(),
            const SizedBox(
              height: 18,
            ),
            _foods(),
            const SizedBox(
              height: 338,
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
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
                color: const Color(0xFF2A2A39),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
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
            'Cart',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              setState(() {
                isEdit = !isEdit;
              });
            },
            splashColor: Colors.transparent,
            child: Text(
              isEdit ? "DONE" : "EDIT ITEMS",
              style: TextStyle(
                color: isEdit ? const Color(0xFF059C6A) : AppColors.primary,
                decoration: TextDecoration.underline,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _foods() {
    return Wrap(
      direction: Axis.vertical,
      spacing: 28,
      children: _fakeSelectedFoods.map((food) {
        return SizedBox(
          height: 137,
          width: MediaQuery.of(context).size.width - 56,
          child: Row(
            children: [
              Container(
                width: 136,
                height: 117,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(food.imageUrl), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      height: 47,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              food.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ),
                          if (isEdit) ...[
                            const SizedBox(
                              width: 16,
                            ),
                            InkWell(
                              onTap: () {
                                // TODO: handle onTap
                              },
                              splashColor: Colors.transparent,
                              child: Container(
                                width: 27,
                                height: 27,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE04444),
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "\$${food.priceForOne}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          food.selectedSize,
                          style: const TextStyle(
                            color: Color(0xFF888891),
                            fontSize: 18,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            // TODO: handle onTap
                          },
                          splashColor: Colors.transparent,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Color(0xFF41414F),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child:
                                const Icon(Icons.remove, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          food.quantity.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        InkWell(
                          onTap: () {
                            // TODO: handle onTap
                          },
                          splashColor: Colors.transparent,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Color(0xFF41414F),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _bottomSheet() {
    return BottomSheet(
      onClosing: () {},
      backgroundColor: const Color(0xFF121223),
      builder: (context) {
        return Container(
          height: 310,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 28,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "DELIVERY ADDRESS",
                  style: TextStyle(color: Color(0xFFA0A5BA), fontSize: 14),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "EDIT",
                    style: TextStyle(
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextInput(
              controller: _addressController,
              hintText: "2118 Thornridge Cir. Syracuse",
            ),
            const Spacer(),
            Row(
              children: [
                const Text(
                  "TOTAL: ",
                  style: TextStyle(color: Color(0xFFA0A5BA), fontSize: 14),
                ),
                Text(
                  "\$${_fakeSelectedFoodsSumPrice.toString()}",
                  style: const TextStyle(
                    fontSize: 30,
                    color: Color(0xFF181C2E),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    // TODO: hanlde onTap
                  },
                  child: const Row(
                    children: [
                      Text(
                        "Breakdown ",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primary,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Spacer(),
            AppButton(onTap: () {}, text: "Place Order"),
            const SizedBox(
              height: 12,
            ),
          ]),
        );
      },
    );
  }
}
