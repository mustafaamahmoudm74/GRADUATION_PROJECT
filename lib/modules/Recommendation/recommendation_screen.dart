//
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'recommendation_api_handler.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({super.key});

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  late Future<Map<String, dynamic>> futureRecommendation;
  final TextEditingController _textController = TextEditingController();
  String? storedText;

  @override
  void initState() {
    super.initState();
    _loadStoredText();
  }

  Future<void> _loadStoredText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      storedText = prefs.getString('stored_text');
      if (storedText != null) {
        futureRecommendation = _loadRecommendation(storedText!);
      }
    });
  }

  Future<void> _saveText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String text = _textController.text;
    await prefs.setString('stored_text', text);
    setState(() {
      storedText = text;
      futureRecommendation = _loadRecommendation(text);
    });

    _showDialog(await _loadRecommendation(text));
  }

  Future<Map<String, dynamic>> _loadRecommendation(String data) async {
    return await RecommendationHandler.getRecommendation(data);
  }

  void _showDialog(Map<String, dynamic> recommendations) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Your Recommendation',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          content: recommendations.isEmpty
              ? const Text('No recommendations available')
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: recommendations.entries.map((entry) {
                      final recommendation = entry.value;
                      if (recommendation is Map) {
                        return ListTile(
                          title: Text(recommendation['title'] ?? 'No title'),
                          subtitle: Text(recommendation['description'] ??
                              'No description'),
                        );
                      } else {
                        return ListTile(
                          subtitle: Text(recommendation.toString()),
                        );
                      }
                    }).toList(),
                  ),
                ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 64),
            const Text("Recommendation System",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: const AssetImage('assets/images/Logo.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 46,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  ),
                  labelText: 'Enter ID',
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 316,
              height: 54,
              child: ElevatedButton(
                onPressed: _saveText,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Get Recommendation',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
            if (storedText != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('ID Entered: $storedText'),
              ),
          ],
        ),
      ),
    );
  }
}
