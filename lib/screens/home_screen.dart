import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

final fakeCategories = List.generate(
    6,
    (index) => CategoryModel(
        id: index, name: "Test $index", imageUrl: "https://placehold.co/44/png"));

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchTextController = TextEditingController();
  int _choosedCategoryIndex = 0;

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: ListView(
            children: [
              // app bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // welcome text
                    RichText(
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

                    const SizedBox(
                      height: 28,
                    ),

                    // search bar
                    TextField(
                      controller: _searchTextController,
                      style: const TextStyle(
                        color: Color(0xFF181C2E),
                      ),
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
                      ),
                    ),

                    const SizedBox(
                      height: 28,
                    ),

                    // categories section
                    Row(
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
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        itemCount: fakeCategories.length,
                        itemBuilder: (context, index) {
                          final category = fakeCategories[index];
                          return GestureDetector(
                            onTap: () {
                              // TODO: continue handling
                              setState(() {
                                _choosedCategoryIndex = index;
                              });
                            },
                            child: Card(
                              elevation: 10,
                              color: index == _choosedCategoryIndex
                                  ? AppColors.primary300
                                  : null,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
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
                                      child: Image.network(category.imageUrl, height: 44, width: 44, ),
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

                    const SizedBox(height: 28,),

                    // restaurants section
                    Row(
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
                    
                    //? continue form building ListView.builder for Open Restaurants
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
