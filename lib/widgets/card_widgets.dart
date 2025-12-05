import 'package:flutter/material.dart';
import 'package:flutterfor_college/models/student.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.student});
  final Student student;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Card(
        color: Colors.amber,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "First name: ${student.fname}",
              style: TextStyle(fontSize: 24, color: Colors.grey.shade800),
            ), // Text
            Text(
              "Last name: ${student.lname}",
              style: TextStyle(fontSize: 24, color: Colors.grey.shade800),
            ), // Text
            Text(
              "City: ${student.city}",
              style: TextStyle(fontSize: 24, color: Colors.grey.shade800),
            ), // Text
          ],
        ),
      ),// Card
    ); // SizedBox
  }
}