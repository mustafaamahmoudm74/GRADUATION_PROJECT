import 'package:flutter/material.dart';

import '../../widgets/custom_check_box.dart';
import '../../widgets/custom_text_field_widget.dart';
import '../../widgets/main_layout_widget.dart';
import '../course_screen.dart';
import '../signup_screen.dart';
import 'login_api_handler.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool checked = false;
  bool stuChecked = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _message = '';

  void _login() async {
    try {
      final response = await LoginHandler()
          .login(_usernameController.text, _passwordController.text);

      // Handle successful login response here, e.g., save token, navigate to home screen
      print('Login successful: $response');

      // Save token or perform any necessary actions with the response
      // For example, if response contains a token, save it using shared_preferences

      setState(() {
        _message = 'Logged in successfully';
      });

      // Navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainLayoutWidget(
            currentIndex: 0,
            child: CoursesScreen(),
          ),
        ),
      );
    } catch (e) {
      // Handle login failure
      print(
          'Login failed with exception: $e'); // Print the exception to the console for debugging
      setState(() {
        _message = 'Login failed: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffA3A8B7),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    const Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 32,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 140,
                      height: 116,
                      child: Image.asset(
                        "assets/images/ImageHandler.png",
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 655,
                width: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextFieldWidget(
                      width: 328,
                      height: 48,
                      controller: _usernameController,
                      backGroundColor: Colors.transparent,
                      borderColor: Colors.black,
                      label: "Your ID",
                      prefixIcon: const Icon(Icons.numbers),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextFieldWidget(
                      width: 328,
                      height: 48,
                      controller: _passwordController,
                      backGroundColor: Colors.transparent,
                      borderColor: Colors.black,
                      label: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      obscure: true,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: 328,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomCheckBoxWidget(
                            isChecked: stuChecked,
                            onChange: (_) {
                              stuChecked = _ ?? false;
                              checked = false;
                              setState(() {});
                            },
                            title: "Student",
                          ),
                          CustomCheckBoxWidget(
                            isChecked: checked,
                            onChange: (_) {
                              checked = _ ?? false;
                              stuChecked = false;
                              setState(() {});
                            },
                            title: "Admin",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: 328,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () => _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Don't have an account?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      ),
                      child: const Text(
                        "Register Now",
                        style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.black54,
                            decorationThickness: 2),
                      ),

                      // make row and edit here
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
