import 'package:flutter/material.dart';

class GradientAvatar extends StatelessWidget {
  final String emoji;
  final List<int> rgb;
  final double size;
  final bool ring;
  final double ringWidth;
  final IconData? cameraIcon;

  const GradientAvatar({
    super.key,
    required this.emoji,
    required this.rgb,
    this.size = 50,
    this.ring = false,
    this.ringWidth = 3,
    this.cameraIcon,
  });

  Color get _color => Color.fromARGB(255, rgb[0], rgb[1], rgb[2]);

  @override
  Widget build(BuildContext context) {
    final inner = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _color.withOpacity(0.85),
            _color.withOpacity(0.55),
          ],
        ),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(emoji, style: TextStyle(fontSize: size * 0.5)),
          if (cameraIcon != null)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Color(0xFF25D366),
                  shape: BoxShape.circle,
                ),
                child: Icon(cameraIcon, color: Colors.white, size: size * 0.22),
              ),
            ),
        ],
      ),
    );

    if (!ring) return inner;
    return Container(
      padding: EdgeInsets.all(ringWidth),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF25D366), Color(0xFF128C7E), Color(0xFF075E54)],
        ),
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          color: Color(0xFFE5DDD5),
          shape: BoxShape.circle,
        ),
        child: ClipOval(child: inner),
      ),
    );
  }
}
