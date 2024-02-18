import 'package:flutter/material.dart';
import 'package:sudanese_community/screens/Delivery/item.dart';

class Kufa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the navigation icon
        ),
        title: const Text(
          'Al-Kufa Menu',
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
          padding: EdgeInsets.all(16),
          children: [
            MenuItem(
              name: 'Chicken Broast',
              description:
                  'Fried chicken broast served with fries and garlic sauce',
              price: '17.00',
              imagePath: 'lib/assets/Broast.jpg',
            ),
            MenuItem(
              name: 'Spicy Chicken Broast',
              description: 'Spicy fried chicken wings served with coleslaw',
              price: '17.00',
              imagePath: 'lib/assets/Broast.jpg',
            ),
            MenuItem(
              name: '10 Piece Chicken Nuggets',
              description:
                  'Crunchy to perfection. Includes a bun, fries, and 2 nuggets sauces',
              price: '17.00',
              imagePath: 'lib/assets/Nuggets10.png',
            ),
            MenuItem(
              name: '10 Piece Spicy Chicken Nuggets',
              description:
                  'Spicy and Crunchy to perfection. Includes a bun, fries, and 2 nuggets sauces',
              price: '17.00',
              imagePath: 'lib/assets/Nuggets10.png',
            ),
            MenuItem(
              name: '7 Piece Chicken Nuggets',
              description:
                  'Spicy and Crunchy to perfection. Includes a bun, fries, and 2 nuggets sauces',
              price: '13.50',
              imagePath: 'lib/assets/Nuggets7.png',
            ),
            MenuItem(
              name: '7 Piece Spicy Chicken Nuggets',
              description:
                  'Spicy and Crunchy to perfection. Includes a bun, fries, and 2 nuggets sauces',
              price: '13.50',
              imagePath: 'lib/assets/Nuggets7.png',
            ),
            /*
            MenuItem(
              name: 'Shawarma Sandwich',
              description:
                  'Grilled chicken shawarma wrapped in pita bread with tahini sauce',
              price: '6.99',
              imagePath: 'lib/assets/Albaik.jpg',
            ),
            MenuItem(
              name: 'Fish Fillet',
              description:
                  'Crispy fried fish fillet served with tartar sauce and fries',
              price: '12.99',
              imagePath: 'lib/assets/Albaik.jpg',
            ),
            */
            // Add more menu items as needed
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String imagePath;

  const MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MenuItemDetails(
                name: name,
                description: description,
                price: price,
                imagePath: imagePath,
              ),
            ),
          );
        },
        leading: Image.asset(
          imagePath,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 4),
            Text(
              'SR $price',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
