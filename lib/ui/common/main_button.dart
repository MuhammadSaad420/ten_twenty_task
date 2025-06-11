import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.buttonColor,
    this.textColor,
    required this.title,
    required this.onPressed,
    this.isDisabled = false,
  });

  final String title;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback onPressed;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isDisabled ? 0.2 : 1,
      duration: const Duration(milliseconds: 200),
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: buttonColor != null
              ? MaterialStateProperty.all(buttonColor)
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
