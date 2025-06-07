import 'package:flutter/material.dart';
import 'package:formtest/page/form.dart';

import 'package:formtest/homepage.dart';
import 'package:formtest/page/start.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignments',
      initialRoute: '/',
      routes: {
        '/': (context) => const AssignmentHomePage(),
        '/form': (context) => const MyCustomForm(),
        '/fastfood': (context) => const StartPage(), // You’ll define this next
      },
    );
  }
}
