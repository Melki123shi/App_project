import 'package:flutter/material.dart';
import '../employee/profile_page.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfilePage(
                        name: "Hiwot Beyene",
                        email: 'hiwi@gmail.com',
                        jobTitle: "Higher Sales",
                        phoneNumber: "+251988049229",
                        ImgUrl: 'images/photo.jpg',
                      )),
            );
          },
          child: CircleAvatar(
            backgroundImage: AssetImage('images/photo.jpg'),
          ),
        ),
        SizedBox(
          width: 15.0,
        ),
      ],
    );
  }
}
