import 'package:flutter/material.dart';

import '../../utilities/share_pref.dart';
import '../../widgets/custom_text_field_widget.dart';
import '../../widgets/main_layout_widget.dart';
import '../Courses/course_screen.dart';
import '../SignUp/signup_screen.dart';
import 'login_api_handler.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _message = '';

  void _login() async {
    try {
      final response = await LoginHandler()
          .login(_usernameController.text, _passwordController.text);

      print('Login successful: $response');
      await UserPreferences.saveUserId(_usernameController.text);
      setState(() {
        _message = 'Logged in successfully';
      });

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
                      suffixIcon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      obscure: !_isPasswordVisible,
                      onSuffixTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const SizedBox(
                      width: 328,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: 328,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _login,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
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
                              decorationThickness: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      _message,
                      style: TextStyle(
                        color: _message.contains('successfully')
                            ? Colors.green
                            : Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
