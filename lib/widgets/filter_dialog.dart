import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

final _fakeOffers = [
  "Delivery",
  "Pick Up",
  "Offer",
  "Online payment available",
];

final _fakeDeliverTime = [
  "10-15 min",
  "20 min",
  "30 min",
];

final _fakePricing = [
  "\$",
  "\$\$",
  "\$\$\$",
];

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  int? _activeOfferIndex;
  int? _activeDeliverTimeIndex;
  int? _activePricingIndex;
  int _activeRating = 0;

  Widget _sectionText(String txt) {
    return Text(
      txt.toUpperCase(),
      style: const TextStyle(
        fontSize: 13,
        color: Color(0xFF32343E),
      ),
    );
  }

  Widget _flexContainer({
    required String txt,
    required int index,
    required VoidCallback onTap,
    bool active = false,
    bool circle = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: circle ? null : const EdgeInsets.all(12),
          width: circle ? 45 : null,
          height: circle ? 45 : null,
          decoration: BoxDecoration(
            color: active ? const Color(0xFFF58D1D) : null,
            borderRadius: BorderRadius.circular(40),
            border: Border(
              top: BorderSide(
                width: 2,
                color:
                    active ? const Color(0xFFF58D1D) : const Color(0xFFEDEDED),
              ),
              bottom: BorderSide(
                width: 2,
                color:
                    active ? const Color(0xFFF58D1D) : const Color(0xFFEDEDED),
              ),
              left: BorderSide(
                width: 2,
                color:
                    active ? const Color(0xFFF58D1D) : const Color(0xFFEDEDED),
              ),
              right: BorderSide(
                width: 2,
                color:
                    active ? const Color(0xFFF58D1D) : const Color(0xFFEDEDED),
              ),
            ),
          ),
          margin: const EdgeInsets.only(top: 12),
          child: Center(
            child: Text(
              txt,
              style: TextStyle(
                color: active ? Colors.white : const Color(0xFF181C2E),
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _ratingBar() {
    return Wrap(
      spacing: 12,
      children: List.generate(5, (index) => index + 1).map((i) {
        final active = i <= _activeRating;
        return GestureDetector(
          onTap: () {
            setState(() {
              _activeRating = i;
            });
          },
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: 45,
              height: 45,
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
              margin: const EdgeInsets.only(top: 12),
              child: Center(
                child: Icon(
                  Icons.star,
                  color: active ? AppColors.primary : const Color(0xFFD9D9D9),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Filter your search",
                  style: TextStyle(
                    color: Color(0xFF181C2E),
                    fontSize: 17,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(CircleBorder()),
                    padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xFFECF0F4),
                    ),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Color(0xFF464E57),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionText("Offers"),
                      Wrap(
                        spacing: 12,
                        children: _fakeOffers
                            .asMap()
                            .entries
                            .map(
                              (entry) => _flexContainer(
                                  txt: entry.value,
                                  index: entry.key,
                                  active: entry.key == _activeOfferIndex,
                                  onTap: () {
                                    setState(() {
                                      _activeOfferIndex = entry.key;
                                    });
                                  }),
                            )
                            .toList(),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      _sectionText("Deliver time"),
                      Wrap(
                        spacing: 12,
                        children: _fakeDeliverTime
                            .asMap()
                            .entries
                            .map(
                              (entry) => _flexContainer(
                                  txt: entry.value,
                                  index: entry.key,
                                  active: entry.key == _activeDeliverTimeIndex,
                                  onTap: () {
                                    setState(() {
                                      _activeDeliverTimeIndex = entry.key;
                                    });
                                  }),
                            )
                            .toList(),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      _sectionText("Pricing"),
                      Wrap(
                        spacing: 12,
                        children: _fakePricing
                            .asMap()
                            .entries
                            .map(
                              (entry) => _flexContainer(
                                  txt: entry.value,
                                  index: entry.key,
                                  active: entry.key == _activePricingIndex,
                                  circle: true,
                                  onTap: () {
                                    setState(() {
                                      _activePricingIndex = entry.key;
                                    });
                                  }),
                            )
                            .toList(),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      _sectionText("Rating"),
                      _ratingBar(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: AppButton(onTap: () {}, text: "Filter"),
          )
        ],
      ),
    );
  }
}
