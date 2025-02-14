import 'package:flutter/material.dart';
import 'package:marham/Screens/deseases.dart';
import 'package:marham/Screens/doctor.dart';
import 'package:marham/Screens/horizontal_boxes_screen.dart';
import 'package:marham/Screens/symptoms.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCity = "Select City"; // Default selected city

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.grey.withOpacity(0.5),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.teal), // Sidebar menu icon
          onPressed: () {
            // Handle menu button press
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                'assets/images/download (1).png',
                height: 30,
                width: 37,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "MetaXperts",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.notifications, color: Colors.teal),
          SizedBox(width: 16),
        ],
      ),

      body: SingleChildScrollView( // ✅ Make page scrollable
        child: Container(
          width: double.infinity,
          height: 1500, // ✅ Ensure content fits
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left Side: User Image & "Log In" Text
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 17,
                          backgroundImage: AssetImage('assets/images/user.png'),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Log In",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    // Right Side: Location Icon & Dropdown
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.teal),
                        SizedBox(width: 8),
                        DropdownButton<String>(
                          value: selectedCity,
                          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          underline: SizedBox(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCity = newValue!;
                            });
                          },
                          items: ["Select City", "Sialkot", "Lahore", "Karachi", "Multan"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "     Search by Doctor",
                        suffixIcon: Icon(Icons.search, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // Appointments Field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "My Appointments",
                      labelStyle: TextStyle(color: Colors.teal.shade900),
                      prefixIcon: Icon(Icons.calendar_month_sharp, color: Colors.teal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.cyan.shade100),
                      ),
                      filled: true,
                      fillColor: Colors.cyan.shade100,
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Doctor Section
                SizedBox(
                  height: 342,
                  width: double.infinity,
                  child: DoctorScreen(),
                ),

                SizedBox(height: 20),

                // Horizontal and Vertical Boxes
                SizedBox(
                  height: 270,
                  width: double.infinity,
                  child: HorizontalVerticalBoxesScreen(),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: SymptomsScreen(),
                ),
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: DeseasesScreen(),
                ),
                SizedBox(height: 0,)
              ],
            ),
          ),
        ),
      ),

    );
  }
}
