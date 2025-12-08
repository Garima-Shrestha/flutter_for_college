import 'package:flutter/material.dart';
import 'package:flutterfor_college/screens/alertdialog_screen.dart';
import 'package:flutterfor_college/screens/dashboard_screen.dart';
import 'package:flutterfor_college/screens/datatable_screen.dart';
import 'package:flutterfor_college/screens/employee_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Apps for College',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
      // home: const EmployeeScreen(),
      // home: const DatatableScreen(),
      // home: const AlertdialogScreen(),
    );
  }
}
