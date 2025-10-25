import 'package:flutter/material.dart';

ButtonStyle myButton() {
  return ElevatedButton.styleFrom(
    elevation: 3,
    shadowColor: Colors.deepOrangeAccent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
    textStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700
    )

  );
}
Widget buildButton(String title, double width, double height) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      onPressed: () {},
      style: myButton(),
      child: Text(title,),
    ),
  );
}