import 'package:flutter/material.dart';

class ResusableCard extends StatelessWidget {
  const ResusableCard(
      {super.key, required this.mycolor, required this.cardChild});
  final Color mycolor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: mycolor,
      ),
      child: cardChild,
    );
  }
}