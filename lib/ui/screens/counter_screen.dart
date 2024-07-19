import 'package:flutter/material.dart';
import 'package:project_3/data/validator/My_Validator.dart';
import 'package:project_3/ui/widgets/My_Form_Field.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter=0;
  int sum =0;
  void _increaseCounter(){
    setState(() {
      _counter++;
    });
  }
  TextEditingController numder1Cpontroller =TextEditingController();
  TextEditingController numder2Cpontroller=TextEditingController();
  var sumKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     appBar: AppBar(
    //       title: Text(
    //           'Counter',
    //         textAlign: TextAlign.center,
    //       ),
    //     ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text('You have pushed the button this many times:',),
    //         SizedBox(height: 20),
    //         ElevatedButton(
    //           onPressed: _increaseCounter,
    //           child: Text('Increment Counter'),
    //         ),
    //         SizedBox(height: 20,),
    //         Text('$_counter',),
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Form(
          key: sumKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyFormField(
                  controller: numder1Cpontroller,
                  hintText: 'First name',
                  validator:MyValidator.checkValidator
              ),
              SizedBox(height: 20,),
              MyFormField(
                  controller: numder2Cpontroller,
                  hintText: 'Last name',
                  validator:MyValidator.checkValidator
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    if(sumKey.currentState!.validate()){
                      final num1 =int.parse(numder1Cpontroller.text);
                      final num2 =int.parse(numder2Cpontroller.text);
                      sum=num1+num2;
                      setState(() {});
                    }
                  },
                  child: Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

