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

TextStyle myText(double size, {FontWeight? weight}){
  return TextStyle(
    fontSize: size,
    fontWeight: weight
  );
}

Widget myButtonStyle(String title, VoidCallback? onPressed) {
  return SizedBox(
    height: 50,
    width: 120,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      child: Text(title),
    ),
  );
}