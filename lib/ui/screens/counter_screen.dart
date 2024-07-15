import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter=0;
  void _increaseCounter(){
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Counter'),
        ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 170),
            Text('Push the buttom to increase by 1'),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed:_increaseCounter,
                child: Text('Increment Counter'),
            ),
            SizedBox(height: 30),
            Text('$_counter'),
          ],
        ),
      ),
    );
  }
}

