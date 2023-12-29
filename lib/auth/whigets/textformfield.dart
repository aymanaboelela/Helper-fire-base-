import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hinttext ; 
  final void Function(String?)?  onChanged;


  const CustomTextForm({super.key, required this.hinttext, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    onChanged:onChanged ,
 
      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 184, 184, 184))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
