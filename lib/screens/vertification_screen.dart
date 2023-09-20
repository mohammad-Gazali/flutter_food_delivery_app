import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/widgets/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VertificationScreen extends StatefulWidget {
  const VertificationScreen({super.key});

  @override
  State<VertificationScreen> createState() => _VertificationScreenState();
}

class _VertificationScreenState extends State<VertificationScreen> {
  final _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2E),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Color(0xFF1E1E2E),
            ),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 28,
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: FloatingActionButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              backgroundColor: Colors.white,
                              elevation: 0,
                              focusElevation: 0,
                              hoverElevation: 0,
                              disabledElevation: 0,
                              highlightElevation: 0,
                              child: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Color(0xFF5E616F),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Verification",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "We have sent a code to your email",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      // TODO: add the real email here
                      const Text(
                        "example@gmail.com",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 56,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 28,
                            right: 28,
                            top: 28,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24),
                            ),
                          ),
                          child: Column(
                            children: [
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 400,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "CODE",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: const Text(
                                                "Resend",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ),
                                            // TODO: add seconds number
                                            const Text(
                                              " in.40sec",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    PinCodeTextField(
                                      length: 4,
                                      appContext: context,
                                      controller: _pinController,
                                      keyboardType: TextInputType.number,
                                      enableActiveFill: true,
                                      showCursor: false,
                                      textStyle: const TextStyle(
                                        color: Color(0xFF32343E),
                                      ),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      hintCharacter: "?",
                                      hintStyle: const TextStyle(
                                      color: Color(0xFFA0A5BA),
                                      ),
                                      pinTheme: PinTheme(
                                        borderRadius: BorderRadius.circular(10),
                                        shape: PinCodeFieldShape.box,
                                        fieldHeight: 62,
                                        fieldWidth: 62,
                                        activeColor: Colors.transparent,
                                        disabledColor: Colors.transparent,
                                        inactiveColor: Colors.transparent,
                                        selectedColor: Colors.transparent,
                                        activeFillColor:
                                            const Color(0xFFF0F5FA),
                                        inactiveFillColor:
                                            const Color(0xFFF0F5FA),
                                        selectedFillColor:
                                            const Color(0xFFD9E2EA),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 36,
                              ),
                              AppButton(onTap: () {}, text: "verify"),
                              const SizedBox(
                                height: 26,
                              ),
                              const SizedBox(
                                height: 56,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
