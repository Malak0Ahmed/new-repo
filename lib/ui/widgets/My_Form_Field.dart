import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  const MyFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withOpacity(0.2),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:const BorderSide(
            color: Colors.black,
            width: 3,
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
            borderSide:const BorderSide(
              color: Colors.green,
              width: 3,
            )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
            borderSide:const BorderSide(
              color: Colors.red,
              width: 3,
            )
        ),
        hintText: hintText,
        label: Text(hintText),
        suffixIcon: Icon(
          Icons.plus_one,
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
