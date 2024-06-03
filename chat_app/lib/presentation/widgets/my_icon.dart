import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  final IconData icon;
  const MyIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        8,
      ),
      decoration: BoxDecoration(
        color: const Color(
          0xFF3a2144,
        ),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Icon(
        icon,
        color: const Color(
          0xffc199cd,
        ),
      ),
    );
  }
}
