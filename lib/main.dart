import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_planner/pages/home_page.dart';
import 'package:workout_planner/pages/profile_page.dart';
import 'package:workout_planner/pages/add_new_page.dart';
import 'package:workout_planner/pages/favourites_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

int currentIndex = 0;

  // List of pages to navigate

final List<Widget> pages = [
    HomePage(),
    ProfilePage(),
    AddNewPage(),
    FavouritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workout Planner',
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    home: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
      
        onTap: (index) {
          setState(() {
            // Update the current page based on the index
           currentIndex = index;
          });
        },
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add New'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourites'),
        ],
      ),
body: pages[currentIndex], // Display the current page based on the index
      

    ),
    );
  }
}


