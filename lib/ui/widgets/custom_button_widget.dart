import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double height;
  final double width;
  final bool isIconButton;
  final Widget icon ;
  final Color backgroundColor;
  CustomButtonWidget({required this.onPressed, this.buttonText = "",
    required this.width, required this.height ,
    this.isIconButton  = false, this.icon = const Icon(Icons.favorite_border),
  required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return isIconButton
        ? IconButton(onPressed: onPressed, icon: icon,color: backgroundColor,)
    : ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
      ),
        onPressed: onPressed,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(buttonText , textAlign: TextAlign.center),
        ]),
      );
  }
}
