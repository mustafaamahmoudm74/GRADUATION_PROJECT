import 'package:flutter/material.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[300],
                  backgroundImage:
                      const AssetImage('assets/images/ImageHandler.png'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          const Text(
            " Your Recommendation is : ",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
