import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50 ,
      child: ElevatedButton(
          style: ButtonStyle(
            animationDuration: const Duration(milliseconds: 200),
            backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                if( states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)){
                return Colors.blueAccent;
              }
              return Colors.lightBlueAccent;
              },
            ),
          ),
          onPressed: onPressed,
          child: Text(text)),
    );
  }
}
