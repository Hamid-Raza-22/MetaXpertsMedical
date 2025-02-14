import 'package:flutter/material.dart';

class SymptomsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> symptoms = [
    {"image": "assets/images/fever.png", "text": "Fever", "boxSize": 120.0, "imageSize": 80.0},
    {"image": "assets/images/cough.png", "text": "Cough", "boxSize": 110.0, "imageSize": 70.0},
    {"image": "assets/images/fever.png", "text": "Headache", "boxSize": 130.0, "imageSize": 85.0},
    {"image": "assets/images/cough.png", "text": "Cold", "boxSize": 100.0, "imageSize": 65.0},
    {"image": "assets/images/fever.png", "text": "Fatigue", "boxSize": 140.0, "imageSize": 90.0},
    {"image": "assets/images/cough.png", "text": "Body Pain", "boxSize": 115.0, "imageSize": 75.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color of the screen
      body: Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align left & right
                  children: [
                    Text(
                      "Symptoms",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          "View all",
                          style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 5), // Space between text and icon
                        Icon(Icons.double_arrow, size: 16, color: Colors.blue), // Small next icon
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),

            SizedBox(height: 10),
            // Scrollable Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: symptoms.map((symptom) {
                  return _buildSymptomBox(
                    symptom["image"]!,
                    symptom["text"]!,
                   // symptom["boxSize"]!,
                    //symptom["imageSize"]!,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSymptomBox(String imagePath, String text,) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12), // Space between boxes
          width: 60, // Custom width for each box
          height: 60, // Custom height for each box
          decoration: BoxDecoration(
            color: Colors.white, // Background color of the box
            borderRadius: BorderRadius.circular(31), // Rounded corners for the box
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(2, 3),
              ),
            ],
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22), // Make image circular
              child: Image.asset(
                imagePath,
                width: 40, // Custom width for each image
                height: 40, // Custom height for each image
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
