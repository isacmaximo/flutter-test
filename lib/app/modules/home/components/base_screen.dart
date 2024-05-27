import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget child;
  const BaseScreen({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        body: child,
      ),
    );
  }
}
