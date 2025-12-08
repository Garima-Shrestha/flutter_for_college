import 'package:flutter/material.dart';

class StackLayoutScreen extends StatelessWidget {
  const StackLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: SafeArea(
    //       child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Stack(
    //           clipBehavior: Clip.none,
    //           children: [
    //             Container(
    //               height: 400,
    //               width: 400,
    //               color: Colors.amber,
    //               child: const Text("I am First container"),
    //             ),
    //             Positioned(
    //               top: 1,
    //               right: 1,
    //                 child: Container(
    //                   height: 100,
    //                   width: 100,
    //                   color: Colors.green,
    //                   child: const Text("I am Second container"),
    //                 )
    //             ),
    //             Positioned(
    //                 // bottom: 0,
    //                 // right: 0,
    //                 bottom: -20,
    //                 right: 400 / 2 - 50,
    //                 child: Container(
    //                   height: 100,
    //                   width: 100,
    //                   color: Colors.red,
    //                   child: const Text("I am third container"),
    //                 ))
    //           ],
    //         ),
    //       ),
    //   ),
    // );

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 400,
                width: 400,
                color: Colors.white,
                child: Image.asset("assets/images/stack.jpg"),
              ),
              Positioned(
                  top: 8,
                  right: 10,
                  child: Container(
                    child: Icon(Icons.edit, color: Colors.blue),
                  )
              ),
              Positioned(
                bottom: 12,
                left: 15,
                  child: Container(
                    child: Icon(Icons.thumb_up, color: Colors.blueAccent),
                  )
              ),
              Positioned(
                bottom: 12,
                  left: 73,
                  child: Container(
                    child: Icon(Icons.comment, color: Colors.purple),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
