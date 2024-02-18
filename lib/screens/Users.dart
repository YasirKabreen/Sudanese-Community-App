import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sudanese_community/screens/user_profile.dart';

class Users extends StatefulWidget {
  const Users({Key? key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the navigation icon
        ),
        title: const Text(
          'The Community Members ',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor,
            ],
            stops: [0.3, 0.5, 0.7, 0.9],
          ),
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('UserData')
              .orderBy('department')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error fetching data'));
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No users found'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final userData =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25, // Adjust the radius based on your requirement
                      backgroundColor: Colors.white,
                      child: Center(
                        child: ClipOval(
                          child: userData['photo'] == null
                              ? Icon(
                                  Icons.person,
                                  color: Theme.of(context).primaryColor,
                                  size: 35,
                                )
                              : Image.network(
                                  userData['photo']!,
                                  fit: BoxFit.cover,
                                  width:
                                      50, // Set the width and height to twice the radius
                                  height: 50,
                                ),
                        ),
                      ),
                    ),
                    title: Text(
                      userData['name'],
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'ID: ${userData['id']}',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UserProfile(id: userData['id']),
                      ));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
