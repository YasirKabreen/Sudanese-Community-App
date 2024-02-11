import 'package:flutter/material.dart';

class TaskStatusDropdown extends StatefulWidget {
  @override
  _TaskStatusDropdownState createState() => _TaskStatusDropdownState();
}

class _TaskStatusDropdownState extends State<TaskStatusDropdown> {
  String selectedStatus = 'not selected';
  List<String> statusOptions = [
    'Finished',
    'In Progress',
    'Not Started',
    'not selected'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Status'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: selectedStatus,
          onChanged: (String? newValue) {
            setState(() {
              selectedStatus = newValue!;
            });
          },
          items: statusOptions.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.red),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
