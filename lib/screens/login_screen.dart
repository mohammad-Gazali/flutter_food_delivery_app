import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                      height: 56,
                    ),
                    const Text(
                      "Log In",
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
                      "Please sign in to your existing account",
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
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 1.3,
                                  child: Checkbox(
                                    value: _rememberMe,
                                    activeColor: AppColors.primary,
                                    onChanged: (v) {
                                      setState(() {
                                        _rememberMe = v ?? false;
                                      });
                                    },
                                    side: const BorderSide(
                                      color: Color(0xFFE3EBF2),
                                      width: 2,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _rememberMe = !_rememberMe;
                                    });
                                  },
                                  child: const Text(
                                    "Remember me",
                                    style: TextStyle(
                                      color: Color(0xFF7E8A97),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 36,
                            ),
                            AppButton(onTap: () {}, text: "log in"),
                            const SizedBox(
                              height: 26,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account ?",
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
                                    "SING UP",
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
