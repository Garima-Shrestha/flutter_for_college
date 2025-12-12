import 'package:flutter/material.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    fontFamily: 'OpenSans Regular',
    useMaterial3: true,
  );
}