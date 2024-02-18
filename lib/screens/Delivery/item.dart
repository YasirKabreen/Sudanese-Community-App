import 'package:flutter/material.dart';
import 'package:sudanese_community/screens/Delivery/cart.dart';

class MenuItemDetails extends StatefulWidget {
  final String name;
  final String description;
  final String price;
  final String imagePath;

  const MenuItemDetails({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  @override
  _MenuItemDetailsState createState() => _MenuItemDetailsState();
}

class _MenuItemDetailsState extends State<MenuItemDetails> {
  int _quantity = 1;
  double price1 = 0;
  @override
  Widget build(BuildContext context) {
    double price = double.parse(widget.price);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the navigation icon
        ),
        title: const Text(
          'Item Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Image.asset(
                    widget.imagePath,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    widget.name,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'SR ${widget.price}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //const SizedBox(width: 50),
                Text(
                  'Quantity:',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //const SizedBox(width: 150),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (_quantity > 1) {
                            _quantity--;
                            price1 = price * _quantity;
                          }
                        });
                      },
                    ),
                    Text(
                      '$_quantity',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          _quantity++;
                          price1 = price * _quantity;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  'SR ${price1.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Implement order submission logic here
              // You can access widget.name, widget.price, _quantity, etc. to process the order
              String itemName = widget.name;
              double itemPrice = double.parse(widget.price);
              int quantity = _quantity;
              double totalPrice = itemPrice * quantity;

              // After processing the order, navigate to a new screen to display order details
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderConfirmationScreen(
                    itemName: itemName,
                    itemPrice: itemPrice,
                    quantity: quantity,
                    totalPrice: totalPrice,
                  ),
                ),
              );
            },
            child: Text('Add to Cart'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
