import 'package:flutter/material.dart';
import 'package:project_3/ui/screens/home_nav_bar.dart';

void main() {
  runApp(const NewProject());
}

class NewProject extends StatelessWidget {
  const NewProject({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}


