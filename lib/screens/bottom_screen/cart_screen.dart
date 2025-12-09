import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int principal = 0;
  double time = 0.0;
  double rate = 0.0;
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      // child: Center(
      //   child: Text("Welcome to the cart screen"),
      // ),

      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(children: [
          TextField(
            onChanged: (value){
              principal = int.parse(value);
            },
            decoration: InputDecoration(
              labelText: "Enter Principal",
              hintText: "Eg 1200",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 8),
          TextField(
            onChanged: (value){
              time = double.parse(value);
            },
            decoration: InputDecoration(
              labelText: "Enter Time",
              hintText: "Eg 2",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 8),
          TextField(
            onChanged: (value){
              rate = double.parse(value);
            },
            decoration: InputDecoration(
              labelText: "Enter Rate",
              hintText: "Eg 5",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 8),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                setState(() {
                  result = (principal * time * rate)/100;
                });
              }, child: Text("Calculate", style: TextStyle(fontSize: 30)))
          ),

          SizedBox(height: 8),
          Text("The Simple interest is: $result", style: TextStyle(fontSize: 25),)
        ],
        ),
      ),
    );
  }
}
