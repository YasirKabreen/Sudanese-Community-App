import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Final extends StatelessWidget {
  const Final({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Orders').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            Map<String, List<Map<String, dynamic>>> ordersByUser = {};

            // Group orders by user
            snapshot.data!.docs.forEach((document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              String userId = data['userId'];
              if (!ordersByUser.containsKey(userId)) {
                ordersByUser[userId] = [];
              }
              ordersByUser[userId]!.add(data);
            });

            // Build list view with order cards
            return ListView(
              children: ordersByUser.entries.map((entry) {
                String userId = entry.key;
                List<Map<String, dynamic>> orders = entry.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User ID: $userId',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Divider(),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> order = orders[index];
                        return Card(
                          margin: EdgeInsets.all(8),
                          child: ListTile(
                            title: Text(order['itemName']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Quantity: ${order['quantity']}'),
                                Text(
                                    'Total Price: SR ${order['totalPrice'].toStringAsFixed(2)}'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                );
              }).toList(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
