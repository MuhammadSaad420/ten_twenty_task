import 'package:flutter/material.dart';

import 'text_widget.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      this.buttonColor,
      this.textColor,
      required this.title,
      required this.onPressed,
      this.isDisabled = false,
      this.btnWidth});

  final String title;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback onPressed;
  final bool isDisabled;
  final double? btnWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: btnWidth,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ButtonStyle(
          backgroundColor:
              buttonColor != null ? WidgetStateProperty.all(buttonColor) : null,
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          )),
        ),
        child: TextWidget(
          title: title,
          size: 14,
          weight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
