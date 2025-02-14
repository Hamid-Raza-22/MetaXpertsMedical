import 'package:flutter/material.dart';

class DeseasesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> diseases = [
    {"image": "assets/images/unnamed.jpg", "text": "Diabetes", "boxSize": 120.0, "imageSize": 80.0},
    {"image": "assets/images/stomach.avif", "text": "Hypertension", "boxSize": 110.0, "imageSize": 70.0},
    {"image": "assets/images/unnamed.jpg", "text": "Migraine", "boxSize": 130.0, "imageSize": 85.0},
    {"image": "assets/images/stomach.avif", "text": "Asthma", "boxSize": 100.0, "imageSize": 65.0},
    {"image": "assets/images/unnamed.jpg", "text": "Arthritis", "boxSize": 140.0, "imageSize": 90.0},
    {"image": "assets/images/stomach.avif", "text": "Cancer", "boxSize": 115.0, "imageSize": 75.0},
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
                      "Diseases",
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
                children: diseases.map((symptom) {
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
