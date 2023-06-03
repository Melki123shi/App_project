import 'package:flutter/material.dart';

class ImgDescription extends StatelessWidget {
  final String description;
  final String imagePath;

  const ImgDescription({Key? key, required this.description, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: 20,
          height: 20,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 249, 246, 246),
                ),
              ),
            ],
          ),
        ),
      ],
    );
          

  }
}