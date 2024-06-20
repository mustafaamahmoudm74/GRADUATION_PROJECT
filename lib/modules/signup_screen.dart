import 'package:flutter/material.dart';

import '../widgets/custom_check_box.dart';
import '../widgets/custom_text_field_widget.dart';
import 'Login/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool checked = false;
  bool stuChecked = false;

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
                    const CustomTextFieldWidget(
                      width: 328,
                      height: 48,
                      backGroundColor: Colors.transparent,
                      borderColor: Colors.black,
                      label: "First Name",
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const CustomTextFieldWidget(
                      width: 328,
                      height: 48,
                      backGroundColor: Colors.transparent,
                      borderColor: Colors.black,
                      label: "Last Name",
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const CustomTextFieldWidget(
                      width: 328,
                      height: 48,
                      backGroundColor: Colors.transparent,
                      borderColor: Colors.black,
                      label: "Email",
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const CustomTextFieldWidget(
                      width: 328,
                      height: 48,
                      backGroundColor: Colors.transparent,
                      borderColor: Colors.black,
                      label: "ID",
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const CustomTextFieldWidget(
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
                    const CustomTextFieldWidget(
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
                          isChecked: stuChecked,
                          onChange: (_) {
                            stuChecked = _ ?? false;
                            checked = false;
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
                              isChecked: checked,
                              onChange: (_) {
                                checked = _ ?? false;
                                stuChecked = false;
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
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        ),
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
