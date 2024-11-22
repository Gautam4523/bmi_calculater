import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function() onPress;

  ContainerCard(
      {required this.colour, required this.cardChild, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        // height: 200,
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
