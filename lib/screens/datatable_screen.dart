import 'package:flutter/material.dart';
import 'package:flutterfor_college/models/student_datatable.dart';

class DatatableScreen extends StatefulWidget {
  const DatatableScreen({super.key});

  @override
  State<DatatableScreen> createState() => _DatatableScreenState();
}

class _DatatableScreenState extends State<DatatableScreen> {
  List<Student> lstStudent = [
    Student(fname: "Kiran", age: 11),
    Student(fname: 'Achyut', age: 21),
    Student(fname: "Pratik", age: 43),
    Student(fname: "Sudeep", age: 45),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Table'), centerTitle: true),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: DataTable(
          headingRowColor: MaterialStateColor.resolveWith(
              (states) => Colors.amber,
          ),
          border: TableBorder.all(color: Colors.black),
            columns: const[
              DataColumn(label: Expanded(
                  child: Text(
                    'Name',
                    textAlign: TextAlign.center,
                  ),
              ),
              ),
              DataColumn(label: Expanded(
                // Or you can use center widget
                  child: Center(
                    child: Text(
                        "Roll No",
                    ),
                  ),
              ),
              ),
              DataColumn(label: Expanded(
                  // Or you can use center widget
                child: Center(
                    child: Text("Action",
                    ),
                ),
              ),
              ),
            ],
            // rows: [
            //   DataRow(cells: [
            //     DataCell(Center(child: Text("John"))),
            //     DataCell(Center(child: Text("12"))),
            //     DataCell(Expanded(
            //         child: Center(
            //             child: Wrap(
            //               children: [
            //                 IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
            //                 IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
            //               ],
            //             )
            //         )))
            //   ]),
            //   DataRow(cells: [
            //     DataCell(Center(child: Text("Mary"))),
            //     DataCell(Center(child: Text("11"))),
            //     DataCell(Expanded(
            //         child: Center(
            //           child: Wrap(
            //             children: [
            //               IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
            //               IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
            //             ],
            //           ),)))
            //   ]),

          // Displaying data from List
          // rows: [
          //   for (Student student in lstStudent) ... {
          //     DataRow(cells: [
          //       DataCell(Center(child: Text(student.fname!))),
          //       DataCell(Center(child: Text(student.age.toString()))),
          //       DataCell(Expanded(
          //           child: Center(
          //               child: Wrap(
          //                 children: [
          //                   IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
          //                   IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
          //                 ],
          //               )
          //           )))
          //     ]),
          //   }
          //   ],

          // Displaying data using map function
          rows: lstStudent.map((student) => DataRow(
            cells: [
              DataCell(Center(child: Text(student.fname!))),
              DataCell(Center(child: Text(student.age.toString()))),
              DataCell(Center(
                child: Wrap(
                  children: [
                    IconButton(onPressed: () {
                      setState(() {});
                    }, icon: const Icon(Icons.edit),
                    ),
                    IconButton(onPressed: () {
                      setState(() {
                        lstStudent.remove(student);
                      });
                    }, icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              )),
            ],
          )).toList(),
        ),
      ),
    );
  }
}
