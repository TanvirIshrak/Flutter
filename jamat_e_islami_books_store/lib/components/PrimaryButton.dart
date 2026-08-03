import 'package:flutter/material.dart';
class PrimaryButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  const PrimaryButton({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Text(
                buttonName,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.background
                )
            )
          ],
        ),
      ),
    );
  }
}
