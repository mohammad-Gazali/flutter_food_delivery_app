import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

class LocationAccessScreen extends StatelessWidget {
  const LocationAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 250,
                          height: 250,
                          color: const Color(0xFF98A8B8),
                        ),
                        const SizedBox(height: 94,),
                        AppButton(
                          onTap: () {},
                          text: "Access Location",
                          iconSpace: 20,
                          endIcon: Container(
                            alignment: Alignment.center,
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: AppColors.primaryContent.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.location_on_outlined,
                              color: AppColors.primaryContent,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Text(
                          "OUR APP WILL ACCESS YOUR LOCATION ONLY WHILE USING THE APP",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF646982),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
