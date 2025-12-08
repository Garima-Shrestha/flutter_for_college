import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 8,  // horizontal spacing
        mainAxisSpacing: 8,  // vertical spacing
        // crossAxisCount: 2,  // 2 columns
        // children: [
        //   Container(
        //     alignment: Alignment.center,  // value lai container ko center ma lyauna
        //     color: Colors.yellow,
        //     child: const Text(
        //       '1',
        //       style: TextStyle(fontSize: 50, color: Colors.black),
        //     ),
        //   ),
        //   Container(
        //     alignment: Alignment.center,
        //     color: Colors.amber,
        //     child: const Text(
        //       '2',
        //       style: TextStyle(fontSize: 50, color: Colors.black),
        //     ),
        //   ),
        // ],

        // crossAxisCount: 3,  // 3 columns [3 by 3 matrix]
        // children: [
        //   ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Colors.amber), child: Text('1', style: TextStyle(fontSize: 25))),
        //   ElevatedButton(onPressed: (){}, child: Text('2', style: TextStyle(fontSize: 25))),
        //   ElevatedButton(onPressed: (){}, child: Text('3', style: TextStyle(fontSize: 25))),
        // ],

        crossAxisCount: 3,  // 3 columns [3 by 3 matrix]
        children: [
          for (int i = 1; i<=10; i++) ...{
            SizedBox(
              child: ElevatedButton(
                  onPressed: (){},
                  child: Text('$i', style: const TextStyle(fontSize: 50)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.black,
                  ),
              ),
            )
          }
        ],
      )
    );
  }
}
