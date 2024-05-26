import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        maximumSize: Size(size.width * 0.6, 50),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(title),
      ),
    );
  }
}
