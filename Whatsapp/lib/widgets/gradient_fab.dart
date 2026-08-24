import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class GradientFab extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const GradientFab({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.fabGradient,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.tealGreen.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: onPressed,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
