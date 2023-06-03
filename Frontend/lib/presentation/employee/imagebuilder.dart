import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget _buildImageWithDescription(
   
    String description,
    String imagePath,
  ) {
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
