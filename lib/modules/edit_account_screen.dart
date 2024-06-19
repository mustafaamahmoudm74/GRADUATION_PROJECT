import 'package:flutter/material.dart';

import '../widgets/custom_text_field_widget.dart';
import '../widgets/validate.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 42,
            ),
            Text(
              "Edit Account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 42,
            ),
            CustomTextFieldWidget(
              width: 328,
              height: 48,
              backGroundColor: Colors.transparent,
              borderColor: Colors.black,
              label: "Email",
              validator: Validate.validateEmail,
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextFieldWidget(
              width: 328,
              height: 48,
              backGroundColor: Colors.transparent,
              borderColor: Colors.black,
              label: "Email Address",
              validator: Validate.validateEmail,
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextFieldWidget(
              width: 328,
              height: 48,
              backGroundColor: Colors.transparent,
              borderColor: Colors.black,
              label: "Select Country",
              validator: Validate.validateEmail,
            ),
          ],
        ),
      ),
    );
  }
}

// first name
// last name
// email
//country
