import 'package:flutter/material.dart';
import '../util/constants.dart';

class RoundRawButton extends StatelessWidget {
  RoundRawButton({required this.icon, required this.press});

  final Icon icon;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: press,
      shape: CircleBorder(),
      elevation: 6.0,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: icon,
    );
  }
}
