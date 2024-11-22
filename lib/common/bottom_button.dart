import 'package:flutter/material.dart';
import '../util/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.bottomText, required this.onTap});

  final String bottomText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        height: kBottomContainerHeight,
        width: double.infinity,
        color: kBottomContainerColor,
        child: Center(
          child: Text(bottomText, style: kBottomTextStyle),
        ),
      ),
    );
  }
}
