import 'package:flutter/material.dart';
import 'package:ui_sesion/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthBackgroud(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 250),
            CardContainer(child: Text('hola mundo'))
          ],
        ),
      )),
    );
  }
}
