import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.teal),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Enter First Name',
                    labelText: 'First Name',
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Last Name',
                    labelText: 'Last Name',
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    labelText: 'Email',
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter ID Number',
                    labelText: 'ID Number',
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Phone Number',
                    labelText: 'Password',
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter confirm Password',
                    labelText: 'Confirm Password',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
