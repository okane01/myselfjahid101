import 'package:flutter/material.dart';

class ButtonTapped extends StatelessWidget {
  final Icon icon;
  final double size;
  final Function onpressed;

  ButtonTapped(this.icon, this.size, this.onpressed);

  @override
  Widget build(BuildContext context) {
    return Container( 
      width: 30, 
        child: IconButton(
          icon: icon,
          iconSize: size,
          color: Colors.grey[800],
          onPressed: onpressed,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                offset: Offset(4.0, 4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-4.0, -4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(238, 227, 231, 0.9),
              Color.fromRGBO(72, 177, 191, 0.3),
            ],
            stops: [0.1, 1],
          ),
        ), 
    );
  }
}
