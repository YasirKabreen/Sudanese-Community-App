import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sudanese_community/components/textinput.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        title: const Text(
          'User Sign Up',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signInWithPhoneNumber(phone.text);
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
