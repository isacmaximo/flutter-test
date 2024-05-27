import 'package:flutter/material.dart';

class CircleUserWidget extends StatelessWidget {
  const CircleUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.person,
          size: 80,
        ),
      ),
    );
  }
}
