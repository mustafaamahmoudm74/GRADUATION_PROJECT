import 'package:flutter/material.dart';

import '../widgets/main_layout_widget.dart';
import 'Login/login_screen.dart';
import 'courseupload_screen.dart';
import 'help_screen.dart';

class ProfileScreen extends StatelessWidget {
  final bool isAdmin;

  const ProfileScreen({super.key, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 42),
            const Text("Profile",
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
            const SizedBox(height: 24),
            if (!isAdmin)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Welcome my student",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
            if (!isAdmin) const SizedBox(height: 5),
            if (!isAdmin)
              _buildProfileOption(context, 'Help',
                  screen: MainLayoutWidget(
                    currentIndex: 3,
                    child: HelpScreen(),
                  )),
            _buildProfileOption(context, "Logout"),
            _buildProfileOption(context, 'Course Upload',
                screen: MainLayoutWidget(
                  currentIndex: 3,
                  child: CourseUploadScreen(),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, String title,
      {Widget? screen}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {
                if (title == "Logout") {
                  _logout(context);
                } else if (screen != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => screen),
                  );
                }
              },
              child: SizedBox(
                width: 328,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  void _logout(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }
}
