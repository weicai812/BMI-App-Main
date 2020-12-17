import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  CustomCard({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}
