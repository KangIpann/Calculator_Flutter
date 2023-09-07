import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  late final  color;
  late final  textColor;
  late final String buttonText;
  late final buttontapped;
  MyButton(
  {this.color, this.textColor, this.buttontapped, this.buttonText = ''}
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
