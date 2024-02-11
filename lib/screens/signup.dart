import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sudanese_community/components/textinput.dart';
import 'package:sudanese_community/screens/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController whatsapp = TextEditingController();
  final TextEditingController department = TextEditingController();
  final TextEditingController id = TextEditingController();
  final TextEditingController room = TextEditingController();
  final TextEditingController building = TextEditingController();
  final TextEditingController majer = TextEditingController();
  final TextEditingController jobtitle = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the navigation icon
        ),
        title: const Text(
          'User Sign Up',
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InputText(
                control: name,
                hinttext: 'Name',
                obsc: false,
                iconData: Icons.person,
              ),
              const SizedBox(height: 10),
              InputText(
                control: department,
                hinttext: 'Department',
                obsc: false,
                iconData: Icons.business,
              ),
              const SizedBox(height: 10),
              InputText(
                control: majer,
                hinttext: 'Majer',
                obsc: false,
                iconData: Icons.school,
              ),
              const SizedBox(height: 10),
              InputText(
                control: phone,
                hinttext: 'Phone',
                obsc: false,
                iconData: Icons.phone,
              ),
              const SizedBox(height: 10),
              InputText(
                control: whatsapp,
                hinttext: 'WhatsApp',
                obsc: false,
                iconData: Icons.message,
              ),
              const SizedBox(height: 10),
              InputText(
                control: building,
                hinttext: 'Building',
                obsc: false,
                iconData: Icons.home,
              ),
              const SizedBox(height: 10),
              InputText(
                control: room,
                hinttext: 'Room',
                obsc: false,
                iconData: Icons.room,
              ),
              const SizedBox(height: 10),
              InputText(
                control: id,
                hinttext: 'ID',
                obsc: false,
                iconData: Icons.card_membership,
              ),
              const SizedBox(height: 10),
              InputText(
                control: jobtitle,
                hinttext: 'Job Title',
                obsc: false,
                iconData: Icons.work,
              ),
              const SizedBox(height: 10),
              InputText(
                control: email,
                hinttext: 'Email',
                obsc: false,
                iconData: Icons.email,
              ),
              const SizedBox(height: 10),
              InputText(
                control: password,
                hinttext: 'Password',
                obsc: false,
                iconData: Icons.password,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // Create user with email and password
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email.text,
                      password: password.text,
                    );
                    FocusScope.of(context).unfocus();
                    // Get the newly created user's UID
                    String userId = userCredential.user!.uid;

                    // Save user data to Firestore
                    await FirebaseFirestore.instance
                        .collection('UserData')
                        .doc(id.text)
                        .set({
                      'name': name.text.isEmpty ? '----------' : name.text,
                      'department': department.text.isEmpty
                          ? '----------'
                          : department.text,
                      'majer': majer.text.isEmpty ? '----------' : majer.text,
                      'phone': phone.text.isEmpty ? '----------' : phone.text,
                      'whatsapp':
                          whatsapp.text.isEmpty ? '----------' : whatsapp.text,
                      'building':
                          building.text.isEmpty ? '----------' : building.text,
                      'room': room.text.isEmpty ? '----------' : room.text,
                      'id': id.text.isEmpty ? '----------' : id.text,
                      'job title':
                          jobtitle.text.isEmpty ? '----------' : jobtitle.text,
                      'email': email.text.isEmpty ? '----------' : email.text,
                      'password':
                          password.text.isEmpty ? '----------' : password.text,
                      'userid': userId,
                      // Add more fields as needed
                    });

                    // Navigate to the next screen or perform any other action
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SignInScreen()), // Navigate to the sign-in screen
                    );
                  } catch (e) {
                    String errorMessage = 'An error occurred during sign up.';
                    if (e is FirebaseAuthException) {
                      switch (e.code) {
                        case 'weak-password':
                          errorMessage = 'The password provided is too weak.';
                          break;
                        case 'email-already-in-use':
                          errorMessage =
                              'The account already exists for that email.';
                          break;
                        case 'invalid-email':
                          errorMessage = 'The email address is not valid.';
                          break;
                        default:
                          errorMessage = 'Error: ${e.message}';
                      }
                    }

                    // Show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            errorMessage,
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor), // Set background color
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(16)), // Set padding
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Set border radius
                    ),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              SizedBox(height: 10.0), // Add some spacing
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SignInScreen()), // Navigate to the sign-up screen
                  );
                },
                child: Text(
                  'Already have an account? Sign Ip',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
