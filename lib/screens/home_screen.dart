import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

final _fakeCategories = List.generate(
  6,
  (index) => CategoryModel(
    id: index,
    name: "Test ${index + 1}",
    imageUrl: "https://placehold.co/44/png",
  ),
);

final _fakeRestaurants = List.generate(
  9,
  (index) => RestaurantModel(
    id: index,
    name: "Restaurant Test ${index + 1}",
    rate: 4.7,
    estimatedMinutes: 25,
    deliveryPrice: index % 2 == 0 ? 0.0 : 24.99,
    open: true,
    introImage: "https://placehold.co/400x200/png",
    foods: index % 3 == 0
        ? [
            "Burger",
            "Chicken",
            "Rice",
            "Wings",
          ]
        : [
            "Pizza",
          ],
  ),
);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _choosedCategoryIndex = 0;

  Future<void> _showOfferDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        // TODO: handle offer code
        return const OfferDialog(
          offerCode: "1243CD2",
          discountValue: 25,
        );
      },
    );
  }

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
                          onTap: () {},
                          child: Image.asset("assets/menu.png"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    // TODO: handle location here
                    onTap: () {},
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "DELIVER TO",
                          style: TextStyle(
                            color: AppColors.primary400,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              // TODO: put location name
                              "Park Street",
                              style: TextStyle(
                                color: Color(0xFF676767),
                                fontSize: 14,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Color(0xFF676767),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Badge(
                    // TODO: add products number
                    label: const Text("3"),
                    textColor: AppColors.primaryContent,
                    backgroundColor: AppColors.primary,
                    offset: const Offset(-2, 2),
                    textStyle: const TextStyle(
                      fontSize: 14,
                    ),
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(22.5),
                        child: Material(
                          color: const Color(0xFF181C2E),
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset("assets/cart.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // main body
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // welcome text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: RichText(
                    text: TextSpan(
                      // TODO: use the name of the user
                      text: "Hey Mohammed, ",
                      style: GoogleFonts.sen(
                        color: const Color(0xFF1E1D1D),
                      ),
                      children: const [
                        TextSpan(
                          text: "Have a nice day.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 28,
                ),

                // search bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: GestureDetector(
                    onTap: () {
                      // TODO: redirect to search page
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Color(0xFF676767),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Search dishes, restaurants",
                            style: TextStyle(
                              color: Color(0xFF676767),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 28,
                ),

                // categories section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "All Categories",
                        style: TextStyle(
                          color: Color(0xFF32343E),
                          fontSize: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Row(
                          children: [
                            Text(
                              "See All ",
                              style: TextStyle(
                                color: Color(0xFF333333),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color(0xFFA0A5BA),
                              size: 14,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 126,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    itemCount: _fakeCategories.length,
                    itemBuilder: (context, index) {
                      final category = _fakeCategories[index];
                      return GestureDetector(
                        onTap: () {
                          // TODO: continue handling
                          setState(() {
                            _choosedCategoryIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: EdgeInsets.only(
                            left: index == 0 ? 28 : 12,
                            right: index == _fakeCategories.length - 1 ? 28 : 0,
                            top: 14,
                            bottom: 14,
                          ),
                          decoration: BoxDecoration(
                            color: index == _choosedCategoryIndex
                                ? AppColors.primary300
                                : Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 30,
                                color:
                                    const Color(0xFF96969A).withOpacity(0.15),
                                spreadRadius: 0,
                                offset: const Offset(12, 12),
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 44,
                                height: 44,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(22),
                                  child: Image.network(
                                    category.imageUrl,
                                    height: 44,
                                    width: 44,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                category.name,
                                style: const TextStyle(
                                  color: Color(0xFF32343E),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // restaurants section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Open Restaurants",
                        style: TextStyle(
                          color: Color(0xFF32343E),
                          fontSize: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Row(
                          children: [
                            Text(
                              "See All ",
                              style: TextStyle(
                                color: Color(0xFF333333),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color(0xFFA0A5BA),
                              size: 14,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    children: _fakeRestaurants.map((restaurant) {
                      return RestaurantCard(
                        restaurant: restaurant,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
