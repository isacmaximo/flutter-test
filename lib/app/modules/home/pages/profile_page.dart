import 'package:app_test1/app/modules/home/components/base_screen.dart';
import 'package:app_test1/app/modules/home/components/circle_user_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Perfil',
      child: Center(
        child: Column(
          children: [
            Spacer(
              flex: 4,
            ),
            CircleUserWidget(),
            Spacer(
              flex: 1,
            ),
            Text(
              'Username',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Spacer(
              flex: 20,
            ),
          ],
        ),
      ),
    );
  }
}
