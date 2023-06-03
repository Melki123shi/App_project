import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const CardWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[100],
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5.0, spreadRadius: 1.0)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 50,
            width: 40,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style:
                const TextStyle(fontSize: 7.0, fontWeight: FontWeight.normal),
          ),
          Text(
            description,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 8.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

