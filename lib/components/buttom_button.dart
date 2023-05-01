import 'package:flutter/material.dart';
import '/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(
      {super.key, required this.onTap, required this.buttonlabel});
  final VoidCallback onTap;
  final String buttonlabel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 3.0),
        color: bottomConatinerColor,
        margin: const EdgeInsets.only(top: 15.0),
        height: 60.0,
        width: double.infinity,
        child: Center(
          child: Text(
            buttonlabel,
            style: calStyle,
          ),
        ),
      ),
    );
  }
}