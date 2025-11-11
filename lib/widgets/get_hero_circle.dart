import 'package:flutter/material.dart';

class GetHeroCircle extends StatelessWidget {
  const GetHeroCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 160,
      left: 140,
      child: CircleAvatar(
        radius: 60,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromRGBO(0, 38, 77, 1.0),
        child: Icon(Icons.person_outline_rounded, size: 90),
      ),
    );
  }
}
