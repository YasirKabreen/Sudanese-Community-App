import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants'),
      ),
      body: ListView(
        children: [
          RestaurantTile(
            name: 'Al-Baik',
            imagePath:
                'lib/assets/Albaik.jpg', // Replace with actual image path
            onTap: () {
              // Handle onTap event for Al-Baik
            },
          ),
          RestaurantTile(
            name: 'Al Kofa',
            imagePath: 'lib/assets/kufa.jpg', // Replace with actual image path
            onTap: () {
              // Handle onTap event for Al Kofa
            },
          ),
          RestaurantTile(
            name: 'Agashi',
            imagePath:
                'lib/assets/hq720.webp', // Replace with actual image path
            onTap: () {
              // Handle onTap event for Agashi
            },
          ),
          // Add more RestaurantTiles for additional restaurants
        ],
      ),
    );
  }
}

class RestaurantTile extends StatelessWidget {
  final String name;
  final String imagePath;
  final VoidCallback onTap;

  const RestaurantTile({
    required this.name,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
