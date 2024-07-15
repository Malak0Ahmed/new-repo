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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times:',),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _increaseCounter,
              child: Text('Increment Counter'),
            ),
            SizedBox(height: 20,),
            Text('$_counter',),
          ],
        ),
      ),
    );
  }
}

