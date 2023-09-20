import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();  

  @override
  void dispose() {
    _emailController.dispose();
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
                        "Forgot Password",
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
                        "Please write your email",
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                              const SizedBox(
                                height: 28,
                              ),
                              AppTextInput(
                                label: "Email",
                                hintText: "example@gmail.com",
                                controller: _emailController,
                                type: TextInputType.emailAddress,
                              ),
                              const SizedBox(
                                height: 36,
                              ),
                              AppButton(onTap: () {}, text: "send code"),
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
