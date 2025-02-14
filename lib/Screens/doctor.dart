import 'package:flutter/material.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Background color of the screen
      child: Padding(
        padding: const EdgeInsets.only(top: 20), // Padding for spacing
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft, // Align text to the top left
              child: Text(
                'How can we help you today?',
                textAlign: TextAlign.left, // Align text within the widget
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // Optional: Adjust font size
                ),
              ),
            ),
SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the boxes
              children: [
                // First Box (Video Consultation)
                _buildConsultationBox(
                  title: "Video Consultation",
                  subtitle: "PMC Verified Doctors",
                  imagePath: 'assets/images/downloadDoc.png',
                  boxHeight: 190,
                  boxWidth: 150,
                  imageHeight: 125,
                  imageWidth: 90,
                  bgColor: Colors.cyan.shade50, // Different background color
                  isImageRight: false, // Image stays centered
                ),

                // Second & Third Box (Chat & Audio Consultation)
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Column(
                    children: [
                      _buildConsultationBox(
                        title: "In-Clinic Visit",
                        subtitle: "Book Appointment",
                        imagePath: 'assets/images/doc.png',
                        boxHeight: 88,
                        boxWidth: 200,
                        imageHeight: 77,
                        imageWidth: 60,
                        bgColor: Colors.deepOrangeAccent.shade100, // Different background color
                        isImageRight: true, // Image on the right side
                      ),
                      SizedBox(height: 10), // Space between second and third box
                      _buildConsultationBox(
                        title: "INSTANT DOCTOR",
                        subtitle: "The Fast Way To Health",
                        imagePath: 'assets/images/male-doctor-.webp',
                        boxHeight: 88,
                        boxWidth: 200,
                        imageHeight: 77,
                        imageWidth: 55,
                        bgColor: Colors.greenAccent.shade100, // Different background color
                        isImageRight: true, // Image on the right side
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Added spacing between sections
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Evenly space boxes
              children: [
                _buildConsultationBox(
                  title: "Weight Loss",
                  subtitle: "Healthy Lifestyle",
                  imagePath: 'assets/images/images.png',
                  boxHeight: 88,
                  boxWidth: 150,
                  imageHeight: 60,
                  imageWidth: 49,
                  bgColor: Colors.limeAccent.shade100, // Different background color
                  isImageRight: true, // Image on the right side
                ),
                _buildConsultationBox(
                  title: "Care Program",
                  subtitle: "Subscription Plan",
                  imagePath: 'assets/images/family.png',
                  boxHeight: 88,
                  boxWidth: 200,
                  imageHeight: 77,
                  imageWidth: 78,
                  bgColor: Colors.blueAccent.shade100, // Different background color
                  isImageRight: true, // Image on the right side
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildConsultationBox({
    required String title,
    required String subtitle,
    required String imagePath,
    required double boxHeight,
    required double boxWidth,
    required double imageHeight,
    required double imageWidth,
    required Color bgColor, // Background color
    required bool isImageRight, // Control image position
  }) {
    return Container(
      height: boxHeight, // Custom box height
      width: boxWidth,   // Custom box width
      padding: EdgeInsets.only(top: 12, left: 10, right: 10),
      decoration: BoxDecoration(
        color: bgColor, // Dynamic background color
        borderRadius: BorderRadius.circular(8), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: isImageRight
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text on the left side
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 9,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          // Image on the right side (without extra bottom padding)
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              imagePath,
              height: imageHeight,
              width: imageWidth,
              fit: BoxFit.cover,
            ),
          ),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 9,
              color: Colors.grey.shade700,
            ),
          ),
          Spacer(), // Added to align elements properly
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                imagePath,
                height: imageHeight,
                width: imageWidth,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
