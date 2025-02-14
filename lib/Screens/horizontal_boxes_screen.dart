import 'package:flutter/material.dart';

class HorizontalVerticalBoxesScreen extends StatelessWidget {
  const HorizontalVerticalBoxesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
      //  mainAxisAlignment: MainAxisAlignment.,
        children: [
          // Horizontal Scrollable Boxes
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Enables horizontal scrolling
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBox("assets/images/download.jpg", "Labs"),
                _buildBox("assets/images/download.jpg", "Medicines"),
                _buildBox("assets/images/download (1).jpg", "Hospitals"),
                _buildBox("assets/images/download (2).jpg", "Blogs"),
              ],
            ),
          ),

          SizedBox(height: 0), // Space between horizontal and vertical boxes

          // Vertical Boxes
          Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildBoxCustomSize(
                "assets/images/doc.png",
                "Get free medical advice by asking a doctor",
                ["Ask a question anonymously", "Get a reply  from PMC verified doctors",], // List of text items
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget _buildBox(String imagePath, String text) {
    return Padding(
      padding: EdgeInsets.only(left: 3.0,right:3,bottom: 24),
      child: Container(
        height: 66, // Box height
        width: 86, // Box width
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                imagePath,
                height: 39, // Image height
                width: 86, // Image width

              ),
            ),
         //   SizedBox(height: 5), // Space between image and text
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),
          ],

        ),
      ),
    );
  }
  Widget _buildBoxCustomSize(String imagePath, String title, List<String> points) {
    return Padding(
      padding: EdgeInsets.only(top: 0.0),
      child: Container(
        height: 180, // Increased height to accommodate buttons
        width: 370,
        decoration: BoxDecoration(
          color: Colors.orangeAccent.shade100,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(2, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 22.0, left: 10, right: 10),
          child: Row(
            children: [
              // Text section with tick icons & buttons
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.teal,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 7),

                    // List of text with tick icons
                    ...points.map((point) => Row(
                      children: [
                        Icon(Icons.check_outlined, color: Colors.green, size: 16),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            point,
                            style: TextStyle(fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )),

                   // Spacer(), // Push buttons to the bottom
SizedBox(height: 24,),
                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Add functionality
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white, // Button color
                              foregroundColor: Colors.teal, // Text color
                              padding: EdgeInsets.symmetric(vertical: 1), // Padding inside button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8), // Rounded corners
                               // side: BorderSide(color: Colors.teal), // Border for the white button
                              ),
                            ),
                            child: Text("View All Questions",style: TextStyle(fontSize: 12),),
                          ),
                        ),
                        SizedBox(width: 10), // Space between buttons
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              // Add functionality
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.teal, // Button color
                              foregroundColor: Colors.white, // Text color
                              padding: EdgeInsets.symmetric(vertical: 1), // Padding inside button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8), // Rounded corners
                              ),
                            ),
                            child: Text("Learn More"),
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
              SizedBox(width: 12),

              // Image section (right)
              ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  imagePath,
                  height: 155,
                  width: 85,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
