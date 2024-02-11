import 'package:flutter/material.dart';

class CommunityOfficersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the navigation icon
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Community Officers',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
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
            ProfileCard(
              officer: CommunityOfficer(
                name: 'John Doe',
                position: 'President',
                //image: 'assets/officer1.jpg',
              ),
            ),
            ProfileCard(
              officer: CommunityOfficer(
                name: 'Jane Smith',
                position: 'Vice President',
                // image: 'assets/officer2.jpg',
              ),
            ),
            ProfileCard(
              officer: CommunityOfficer(
                name: 'Michael Johnson',
                position: 'Treasurer',
                //image: 'assets/officer3.jpg',
              ),
            ),
            ProfileCard(
              officer: CommunityOfficer(
                name: 'Emily Brown',
                position: 'Secretary',
                //image: 'assets/officer4.jpg',
              ),
            ),
            ProfileCard(
              officer: CommunityOfficer(
                name: 'David Williams',
                position: 'Coordinator',
                //image: 'assets/officer5.jpg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommunityOfficer {
  final String name;
  final String position;
  //final String image;

  CommunityOfficer({
    required this.name,
    required this.position,
    // required this.image,
  });
}

class ProfileCard extends StatelessWidget {
  final CommunityOfficer officer;

  const ProfileCard({Key? key, required this.officer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          //backgroundImage: AssetImage(officer.image),
        ),
        title: Text(
          officer.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(officer.position),
        onTap: () {
          // Handle tapping on a profile to view details if needed
          // Navigator.pushNamed(context, '/officer_details', arguments: officer);
        },
      ),
    );
  }
}
