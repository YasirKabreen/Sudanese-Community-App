import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sudanese_community/screens/Delivery/final.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final String itemName;
  final double itemPrice;
  final int quantity;
  final double totalPrice;

  const OrderConfirmationScreen({
    required this.itemName,
    required this.itemPrice,
    required this.quantity,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Order Confirmation',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Thank you for your order!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Item:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    itemName,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Unit Price:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'SR ${itemPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Quantity:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    quantity.toString(),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total Price:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'SR ${totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Menu'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                confirmOrder(context);
              },
              child: Text('Confirm Order'),
            ),
          ],
        ),
      ),
    );
  }

  void confirmOrder(BuildContext context) async {
    // Get the current date
    DateTime now = DateTime.now();

    // Construct a DateTime object for the start of the day
    DateTime startOfDay = DateTime(now.year, now.month, now.day, 0, 0, 0);

    // Construct a DateTime object for the end of the day
    DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

    // Format the date string in "YYYY_MM_DD" format
    String dateString = '${now.year}_${now.month}_${now.day}';
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (user != null) {
      String uid = user.uid;
      //String userName = user.displayName ?? 'Unknown';

      // Add order details to 'Orders' collection
      await FirebaseFirestore.instance
          .collection('Orders')
          .doc(dateString)
          .collection(uid)
          .doc()
          .set({
        'itemName': itemName,
        'itemPrice': itemPrice,
        'quantity': quantity,
        'totalPrice': totalPrice,
        //'userName': userName,
        'userId': uid,
        'orderDate': Timestamp.now().toDate(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Order confirmed!')),
      );

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Final(),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Error confirming order. Please try again later.')),
      );
    }
  }
}
