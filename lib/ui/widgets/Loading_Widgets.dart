import 'package:flutter/material.dart';

class LoadingWidgets extends StatelessWidget {
  const LoadingWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text('Loading....'),
          ]
      ),
    );
  }
}
