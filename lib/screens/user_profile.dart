import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProfile extends StatefulWidget {
  final String id;
  const UserProfile({super.key, required this.id});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var x;

  @override
  void initState() {
    super.initState();
    userData();
  }

  File? image;
  void _takeImage(bool cam) async {
    var picker = ImagePicker();
    var theImage = await picker.pickImage(
        source: cam ? ImageSource.camera : ImageSource.gallery);
    if (theImage == null) {
      return;
    }
    setState(() {
      image = File(theImage.path);
    });
    await FirebaseFirestore.instance
        .collection('UserData')
        .doc(widget.id)
        .update({'photo': theImage.path});

    userData();
  }

  @override
  Widget build(BuildContext context) {
    bool cam = true;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the navigation icon
        ),
        title: const Text(
          'User Profile',
          style: TextStyle(color: Colors.white),
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
            stops: [0.1, 0.3, 0.8, 0.9],
          ),
        ),
        child: SingleChildScrollView(
          child: x == null // Check if user data is null
              ? Center(
                  child:
                      CircularProgressIndicator()) // Show CircularProgressIndicator if data is null
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 4, color: Theme.of(context).primaryColor)),
                      margin: const EdgeInsets.all(8),
                      width: double.infinity,
                      height: 250,
                      child: x['photo'] == null
                          ? Center(
                              child: Icon(
                                Icons.person,
                                size: 150,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          : Image.file(
                              File(x['photo']!),
                              fit: BoxFit.cover,
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                            onPressed: () {
                              cam = false;
                              _takeImage(cam);
                            },
                            icon: const Icon(Icons.camera),
                            label: const Text('Gallery')),
                        TextButton.icon(
                            onPressed: () {
                              cam = true;
                              _takeImage(cam);
                            },
                            icon: const Icon(Icons.camera),
                            label: const Text('Camera'))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    x == null
                        ? const CircularProgressIndicator()
                        : DatText(indecator: 'Name: ', name: x['name']),
                    x == null
                        ? const CircularProgressIndicator()
                        : DatText(indecator: 'Dept: ', name: x['department']),
                    x == null
                        ? const CircularProgressIndicator()
                        : DatText(indecator: 'Phone: ', name: x['phone']),
                    x == null
                        ? const CircularProgressIndicator()
                        : DatText(indecator: 'WhatsApp: ', name: x['whatsapp']),
                    x == null
                        ? const CircularProgressIndicator()
                        : DatText(indecator: 'Room: ', name: x['room']),
                    x == null
                        ? const CircularProgressIndicator()
                        : DatText(
                            indecator: 'Job Title: ', name: x['job title']),
                    x == null
                        ? const CircularProgressIndicator()
                        : DatText(indecator: 'id: ', name: x['id']),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  void userData() async {
    var data = await FirebaseFirestore.instance
        .collection('UserData')
        .doc(widget.id)
        .get();
    setState(() {
      x = data.data();
    });
  }
}

class DatText extends StatelessWidget {
  const DatText({
    super.key,
    required this.name,
    required this.indecator,
  });

  final String name;
  final String indecator;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerRight,
          width: 100,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          child: Text(
            indecator,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
