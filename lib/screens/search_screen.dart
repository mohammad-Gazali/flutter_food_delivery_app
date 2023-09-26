import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

final fakeRecentKeywords = [
  "Burger",
  "Sandwich",
  "Pizza",
  "Salad",
  "Sweet",
];

final _fakePopularFoods = List.generate(5, (index) {
  return FoodModel(
    id: index,
    name: 'Food Name ${index + 1}',
    imageUrl: 'https://placehold.co/122x84/png',
    restaurant: 'Restaurant ${index + 1}',
    price: 29.99,
    category: 'Category ${index + 1}',
  );
});

final fakeSuggestedRestaurants = List.generate(3, (index) {
  return RestaurantModel(
    id: index,
    name: "Test ${index + 1}",
    rate: 4.5,
    estimatedMinutes: 20,
    deliveryPrice: 0,
    foods: [],
    introImage: "https://placehold.co/60x50/png",
    open: true,
  );
});

class SearchScreen extends StatefulWidget {
  final CategoryModel? defaultCategory;
  const SearchScreen({
    super.key,
    this.defaultCategory,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  Widget? _searchBarSuffix;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
                    "Search",
                    style: TextStyle(
                      color: Color(0xFF181C2E),
                      fontSize: 17,
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

            const SizedBox(
              height: 10,
            ),

            // search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: TextField(
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                controller: _searchController,
                style: const TextStyle(
                  color: Color(0xFF181C2E),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      _searchBarSuffix = GestureDetector(
                        onTap: () {
                          _searchController.text = "";
                          setState(() {
                            _searchBarSuffix = null;
                          });
                        },
                        child: const Icon(
                          Icons.cancel,
                          color: Color(0xFFCDCDCF),
                        ),
                      );
                    });
                  } else {
                    setState(() {
                      _searchBarSuffix = null;
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: "Search dishes, restaurants",
                  hintStyle: const TextStyle(
                    color: Color(0xFF676767),
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF676767),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF6F6F6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: _searchBarSuffix,
                ),
              ),
            ),

            const SizedBox(
              height: 36,
            ),

            // recent keywords section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                "Recent Keywords",
                style: TextStyle(
                  color: Color(0xFF32343E),
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 52,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: fakeRecentKeywords.length,
                itemBuilder: (context, index) {
                  final keyword = fakeRecentKeywords[index];
                  return GestureDetector(
                    onTap: () {
                      // TODO: handle tap
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: const Border(
                          top: BorderSide(
                            width: 2,
                            color: Color(0xFFEDEDED),
                          ),
                          bottom: BorderSide(
                            width: 2,
                            color: Color(0xFFEDEDED),
                          ),
                          left: BorderSide(
                            width: 2,
                            color: Color(0xFFEDEDED),
                          ),
                          right: BorderSide(
                            width: 2,
                            color: Color(0xFFEDEDED),
                          ),
                        ),
                      ),
                      margin: EdgeInsets.only(
                        left: index == 0 ? 28 : 12,
                        right: index == fakeRecentKeywords.length - 1 ? 28 : 0,
                      ),
                      child: Center(
                        child: Text(
                          keyword,
                          style: const TextStyle(
                            color: Color(0xFF181C2E),
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
              height: 36,
            ),

            // suggested restaurants section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                "Suggested Restaurants",
                style: TextStyle(
                  color: Color(0xFF32343E),
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: fakeSuggestedRestaurants.map((restaurant) {
                  return GestureDetector(
                    onTap: () {
                      // TODO: handle tap
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          color: Color(0xFFEBEBEB),
                          width: 1,
                        )),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(restaurant.introImage),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            children: [
                              Text(
                                restaurant.name,
                                style: const TextStyle(
                                  color: Color(0xFF32343E),
                                ),
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
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(
              height: 36,
            ),

            // Popular food section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                "Popular Food",
                style: TextStyle(
                  color: Color(0xFF32343E),
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // this attribute is for controlling scroll physics, here we disabled the scroll
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: _fakePopularFoods
                  .map(
                    (r) => PopularFoodCard(
                      popularFood: r,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
