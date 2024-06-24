import 'package:flutter/material.dart';

import '../../widgets/custom_check_box.dart';
import '../../widgets/custom_text_field_widget.dart';
import '../Login/login_screen.dart';
import 'signup_api_handler.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool adminChecked = false;
  bool studentChecked = false;

  // Controllers for text fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final SignupHandler _loginHandler = SignupHandler();

  void _signUp() async {
    try {
      final response = await _loginHandler.signup(
        id: int.tryParse(_idController.text) ?? 0,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
        roleId: adminChecked ? 2 : 1,
      );

      // Handle response
      if (response['success']) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      } else {
        // Handle failure
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'])),
        );
      }
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign up failed: $e')),
      );
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
                      "Sign Up",
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
                      controller: _firstNameController,
                      width: 328,
                      height: 48,
                      backGroundColor: Colors.transparent,
                      borderColor: Colors.black,
                      label: "First Name",
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextFieldWidget(
                      controller: _lastNameController,
                      width: 328,
                      height: 48,
                      backGroundColor: Colors.transparent,
                      borderColor: Colors.black,
                      label: "Last Name",
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextFieldWidget(
                      controller: _emailController,
                      width: 328,
                      height: 48,
                      backGroundColor: Colors.transparent,
                      borderColor: Colors.black,
                      label: "Email",
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextFieldWidget(
                      controller: _idController,
                      width: 328,
                      height: 48,
                      backGroundColor: Colors.transparent,
                      borderColor: Colors.black,
                      label: "ID",
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextFieldWidget(
                      controller: _passwordController,
                      width: 328,
                      height: 48,
                      backGroundColor: Colors.transparent,
                      borderColor: Colors.black,
                      label: "Password",
                      obscure: true,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextFieldWidget(
                      controller: _confirmPasswordController,
                      width: 328,
                      height: 48,
                      backGroundColor: Colors.transparent,
                      borderColor: Colors.black,
                      label: "Confirm Password",
                      obscure: true,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomCheckBoxWidget(
                          isChecked: studentChecked,
                          onChange: (_) {
                            studentChecked = _ ?? false;
                            adminChecked = false;
                            setState(() {});
                          },
                          title: "Student",
                        ),
                        const SizedBox(
                          width: 54,
                        ),
                        Row(
                          children: [
                            CustomCheckBoxWidget(
                              isChecked: adminChecked,
                              onChange: (_) {
                                adminChecked = _ ?? false;
                                studentChecked = false;
                                setState(() {});
                              },
                              title: "Admin",
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 328,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _signUp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
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
