import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2E),
      body: SafeArea(
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
                      "Sign Up",
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
                      "Please sign up to get started",
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
                            AppTextInput(
                              label: "Name",
                              hintText: "Ali Rami",
                              controller: _nameController,
                            ),
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
                              height: 28,
                            ),
                            AppTextInput(
                              label: "Password",
                              hintText: "* * * * * * * * *",
                              controller: _passwordController,
                              isPassword: true,
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                            AppTextInput(
                              label: "Password Confirmation",
                              hintText: "* * * * * * * * *",
                              controller: _passwordConfirmController,
                              isPassword: true,
                            ),
                            const SizedBox(
                              height: 36,
                            ),
                            AppButton(onTap: () {}, text: "sign up"),
                            const SizedBox(
                              height: 26,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account ?",
                                  style: TextStyle(
                                    color: Color(0xFF646982),
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "LOG IN",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            const Text(
                              "Or",
                              style: TextStyle(
                                color: Color(0xFF646982),
                              ),
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            const SocialAuth(),
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
    );
  }
}
