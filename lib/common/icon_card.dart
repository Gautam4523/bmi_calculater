import 'package:flutter/material.dart';
import '../util/constants.dart';

class IconCard extends StatelessWidget {
  final IconData icon;
  final String text;

  IconCard({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: kTextStyle,
        )
      ],
    );
  }
}
