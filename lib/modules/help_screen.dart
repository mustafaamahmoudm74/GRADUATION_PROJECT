import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../widgets/custom_text_field_widget.dart';
import '../widgets/validate.dart';

class HelpScreen extends StatelessWidget {
  HelpScreen({super.key});

  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _fromKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Help & Support",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                Image.asset(
                  "assets/images/help.png",
                  fit: BoxFit.cover,
                ),
                const Text(
                  " For more help, contact our support team!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomTextFieldWidget(
                  width: 328,
                  height: 48,
                  backGroundColor: Colors.transparent,
                  borderColor: Colors.black,
                  label: "Name",
                  validator: Validate.validateNormalString,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextFieldWidget(
                  width: 328,
                  height: 48,
                  backGroundColor: Colors.transparent,
                  borderColor: Colors.black,
                  label: "Email",
                  validator: Validate.validateNormalString,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextFieldWidget(
                  width: 328,
                  height: 48,
                  backGroundColor: Colors.transparent,
                  borderColor: Colors.black,
                  label: "Your Compliment",
                  validator: Validate.validateNormalString,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 328,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_fromKey.currentState!.validate()) {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          text: 'Completed Successfully!',
                          autoCloseDuration: const Duration(seconds: 3),
                          showConfirmBtn: false,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      "Send",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
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
