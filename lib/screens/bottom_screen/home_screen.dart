import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int first = 0;
  int second = 0;
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      // child: Center(
      //   child: Text("Welcome to the home screen"),
      // ),

      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              onChanged: (value){
                first = int.parse(value);
              },
              decoration: InputDecoration(
                labelText: "Enter First Number: ",
                hintText: "Eg. 12",
                border: OutlineInputBorder(),  // Border banaunxa
              ),
            ),
            // Invisible box
            SizedBox(height: 8),
            TextField(
              onChanged: (value){
                second = int.parse(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                enabledBorder: OutlineInputBorder(   // when you do not click on the textfield
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                focusedBorder: OutlineInputBorder(        // when you click on the textfield
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                labelText: "Enter Second Number: ",
                hintText: "Eg. 13",
              ),
            ),
            // Invisible box
            SizedBox(height: 8),
            // Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                setState(() {
                  result = first + second;
                });
              },
                  child: Text("Add", style: TextStyle(fontSize: 30))),
            ),

            SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                setState(() {
                  result = first - second;
                });
              },
                  child: Text("Substract", style: TextStyle(fontSize: 30))),
            ),

            SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                setState(() {
                  result = first * second;
                });
              },
                  child: Text("Multiply", style: TextStyle(fontSize: 30))),
            ),

            SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                setState(() {
                  result = first ~/ second;
                });
              },
                  child: Text("Divide", style: TextStyle(fontSize: 30))),
            ),

            Text("The result is: $result", style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );  }
}
