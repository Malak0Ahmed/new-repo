import 'package:flutter/material.dart';

class MyErrorWidgets extends StatelessWidget {
  final String errorMeg;
  const MyErrorWidgets({
    super.key,
    required this.errorMeg,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            color: Colors.cyanAccent,
            size: 50,
          ),
          const SizedBox(height: 20),
          Text('Error occured: $errorMeg'),
        ],
      ),
    );
  }
}
