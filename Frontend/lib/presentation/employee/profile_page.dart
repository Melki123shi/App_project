import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String email;
  final String phoneNumber;
  final String ImgUrl ;
  

  ProfilePage({
    required this.name,
    required this.jobTitle,
    required this.email,
    required this.phoneNumber,
    required this.ImgUrl,
    
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Your Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(ImgUrl),
            ),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              jobTitle,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(email),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(phoneNumber),
            ),
            SizedBox(height: 20),
           ListTile(

              title: Text('Change Password'),
              onTap: () {
                // Navigate to password change page
              },
            ),
            ListTile(
              title: Text('Your Solds Yet'),
              leading: Icon(Icons.car_rental),
              onTap: () {
                // Navigate to password change page
              },
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              onTap: () {}
                // Implement logout functionality            },
           )
          ],
        ),
      ),
    );
  }
}