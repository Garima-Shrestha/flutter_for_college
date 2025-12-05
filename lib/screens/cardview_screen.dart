import 'package:flutter/material.dart';
import 'package:flutterfor_college/models/student.dart';
import 'package:flutterfor_college/widgets/card_widgets.dart';

class CardViewScreen extends StatelessWidget {
  const CardViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Student> students = [
      Student(fname: "Ram", lname: "Basnet", city: "Kathmandu"),
      Student(fname: "Shyam", lname: "Basnet", city: "Kathmandu"),
      Student(fname: "Sita", lname: "Basnet", city: "Kathmandu"),
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('CardView'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index){
              final student = students[index];
              return CardWidget(student: student);
            }
        )
    );
  }
}