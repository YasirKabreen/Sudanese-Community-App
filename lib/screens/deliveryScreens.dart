import 'package:flutter/material.dart';
import 'package:sudanese_community/screens/Delivery/agasi.dart';
import 'package:sudanese_community/screens/Delivery/albaik.dart';
import 'package:sudanese_community/screens/Delivery/kufa.dart';

class RestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the navigation icon
        ),
        title: const Text(
          'Restaurants',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
              Color(0xFF78C28F),
              Color(0xFF92DDA5),
              Color(0xFFAADFB6),
            ],
            stops: [0.3, 0.6, 0.8, 0.9],
          ),
        ),
        child: ListView(
          children: [
            RestaurantTile(
              name: 'Al-Baik',
              imagePath:
                  'lib/assets/AlBaik.jpg', // Replace with actual image path
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AlBaikScreen()));
              },
            ),
            RestaurantTile(
              name: 'Al-Kufa',
              imagePath:
                  'lib/assets/kufa.jpg', // Replace with actual image path
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Kufa()));
              },
            ),
            RestaurantTile(
              name: 'Al-Agashi',
              imagePath:
                  'lib/assets/hq720.webp', // Replace with actual image path
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AgashiScreen()));
              },
            ),
            // Add more RestaurantTiles for additional restaurants
          ],
        ),
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
                height: 165,
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
