import 'package:flutter/material.dart';
import 'package:sudanese_community/screens/Delivery/item.dart';

class AgashiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the navigation icon
        ),
        title: const Text(
          'Al-Agashi Menu',
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
              name: 'Chicken Agashi',
              description:
                  'Grilled chicken served with seasoned rice and salad',
              price: '12.99',
              imagePath: 'lib/assets/checknAgashi.jpg',
            ),
            MenuItem(
              name: 'Meat Agashi',
              description:
                  'Tender grilled meat served with roasted potatoes and vegetables',
              price: '15.99',
              imagePath: 'lib/assets/AgashiMeat.jpg',
            ),
            MenuItem(
              name: 'Foal Sada',
              description:
                  'Traditional Sudanese foal dish served with flatbread',
              price: '9.99',
              imagePath: 'lib/assets/foalSada.jpg',
            ),
            MenuItem(
              name: 'Foal Mosalh',
              description:
                  'Foal meat marinated in special sauce and grilled to perfection',
              price: '14.99',
              imagePath: 'lib/assets/foal mosalh.jpg',
            ),
            MenuItem(
              name: 'Tamia',
              description:
                  'Deep-fried chickpea patties served with tahini sauce',
              price: '7.99',
              imagePath: 'lib/assets/tamia.jpg',
            ),
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
