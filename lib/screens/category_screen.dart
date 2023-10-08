import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

final _fakeRestaurants = List.generate(
  9,
  (index) => RestaurantModel(
    id: index,
    name: "Restaurant Test ${index + 1}",
    description: "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
    rate: 4.7,
    estimatedMinutes: 25,
    deliveryPrice: index % 2 == 0 ? 0.0 : 24.99,
    open: true,
    introImage: "https://placehold.co/400x200/png",
    foods: index % 3 == 0
        ? [
            _fakePopularFoods[1],
            _fakePopularFoods[2],
            _fakePopularFoods[3],
            _fakePopularFoods[4],
          ]
        : [
            _fakePopularFoods[5],
          ],
    categories: [],
  ),
);

final _fakeCategories = List.generate(
  5,
  (index) => CategoryModel(
    id: index,
    name: "Test ${index + 1}",
    imageUrl: "https://placehold.co/44/png",
  ),
);

final _fakePopularFoods = List.generate(5, (index) {
  return FoodModel(
    id: index,
    name: 'Food Name ${index + 1}',
    description:
        'Prosciutto e funghi is a pizza variety that is topped with tomato sauce.',
    imageUrl: 'https://placehold.co/122x84/png',
    price: 29.99,
    category: _fakeCategories[index],
    sizes: [],
  );
});

class CategoryScreen extends StatefulWidget {
  final CategoryModel category;

  const CategoryScreen({
    super.key,
    required this.category,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Future<void> _showFilterDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        return const FilterDialog();
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
                  Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFECF0F4),
                      ),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.category.name,
                          style: const TextStyle(
                            color: Color(0xFF181C2E),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 30,
                          color: Color(0xFFF58D1D),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22.5),
                      child: Material(
                        color: const Color(0xFF181C2E),
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22.5),
                      child: Material(
                        color: const Color(0xFFECF0F4),
                        child: InkWell(
                          onTap: _showFilterDialog,
                          child: Image.asset("assets/filters.png"),
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

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
              ),
              child: Text(
                "Popular ${widget.category.name}s",
                style: const TextStyle(
                  color: Color(0xFF32343E),
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
              children: _fakePopularFoods
                  .map(
                    (r) => PopularFoodCard(
                      restaurantName: r.restaurant!.name,
                      popularFood: r,
                      withPrice: true,
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(
              height: 32,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 28,
              ),
              child: Text(
                "Open Resturants",
                style: TextStyle(
                  color: Color(0xFF32343E),
                  fontSize: 20,
                ),
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
      ),
    );
  }
}
