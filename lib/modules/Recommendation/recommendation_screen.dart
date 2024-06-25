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
  }

  Future<Map<String, dynamic>> _loadRecommendation(String data) async {
    return await RecommendationHandler.getRecommendation(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recommendations')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter some data',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _saveText,
            child: const Text('Save Data'),
          ),
          if (storedText != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Stored Data: $storedText'),
            ),
          Expanded(
            child: FutureBuilder<Map<String, dynamic>>(
              future: futureRecommendation,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No recommendations available'));
                } else {
                  final recommendations = snapshot.data!;
                  return ListView.builder(
                    itemCount: recommendations.length,
                    itemBuilder: (context, index) {
                      final recommendation =
                          recommendations.values.elementAt(index);
                      if (recommendation is Map) {
                        return ListTile(
                          title: Text(recommendation['title'] ?? 'No title'),
                          subtitle: Text(recommendation['description'] ??
                              'No description'),
                        );
                      } else {
                        return ListTile(
                          title: Text('Invalid data format'),
                          subtitle: Text(recommendation.toString()),
                        );
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
