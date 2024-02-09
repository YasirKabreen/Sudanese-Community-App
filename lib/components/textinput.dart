import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String hinttext;
  final TextEditingController control;
  final bool obsc;
  final IconData iconData;

  const InputText(
      {Key? key,
      required this.control,
      required this.hinttext,
      required this.obsc,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: TextFormField(
        controller: control,
        obscureText: obsc,
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.blueGrey.shade700),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.blueGrey.shade700),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: obsc
              ? Icon(Icons.lock, color: Colors.grey)
              : Icon(iconData, color: Colors.grey),
          suffixIcon: obsc
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility_off, color: Colors.grey),
                )
              : null,
        ),
      ),
    );
  }
}
