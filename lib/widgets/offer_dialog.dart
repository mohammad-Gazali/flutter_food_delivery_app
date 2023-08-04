import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class OfferDialog extends StatelessWidget {
  final String offerCode;
  final int discountValue;

  const OfferDialog({
    super.key,
    required this.offerCode,
    required this.discountValue,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          FittedBox(
            child: Container(
              margin: const EdgeInsetsDirectional.only(top: 26),
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                gradient: const LinearGradient(
                  transform: GradientRotation(1.2),
                  stops: [
                    0,
                    0.4,
                    1
                  ],
                  colors: [
                    Color(0xFFFCDA33),
                    Color(0xFFF2A718),
                    Color(0xFFE76F00),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/offer-image.png")),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 36,
                        ),
                        Text(
                          "Hurry Offers!",
                          style: GoogleFonts.sen(
                            color: AppColors.primaryContent,
                            fontWeight: FontWeight.w800,
                            fontSize: 41,
                          ),
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        Text(
                          "#$offerCode",
                          style: const TextStyle(
                            color: AppColors.primaryContent,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Text(
                    "Use the coupon get $discountValue% discount",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.primaryContent,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: const ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(
                        Size(280, 60),
                      ),
                      side: MaterialStatePropertyAll(
                        BorderSide(
                          width: 2,
                          color: AppColors.primaryContent,
                        ),
                      ),
                    ),
                    child: const Text(
                      "GOT IT",
                      style: TextStyle(
                        color: AppColors.primaryContent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: SizedBox(
              width: 45,
              height: 45,
              child: Material(
                elevation: 10,
                shadowColor: const Color(0x79000000),
                borderRadius: BorderRadius.circular(22.5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22.5),
                  child: Material(
                    color: AppColors.primary250,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          color: AppColors.primary450,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
