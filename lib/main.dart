import 'package:flutter/material.dart';
import 'screens/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
    ),
  );
}
