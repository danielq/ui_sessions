import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_sesion/providers/login_form_provider.dart';
import 'package:ui_sesion/widgets/widgets.dart';
import 'package:ui_sesion/ui/input_decorations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroud(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 250),
            CardContainer(
                child: Column(
              children: [
                const SizedBox(height: 10),
                const Text('Login'),
                const SizedBox(height: 30),
                ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: _LoginForm(),
                )
              ],
            )),
            const SizedBox(height: 50),
            const Text('Crear una nueva cuenta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
          ],
        ),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
          key: loginForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'jhon.doe@correo.com',
                    labelText: 'Correo Electronico',
                    prefixIcon: Icons.alternate_email_outlined),
                onChanged: (value) => loginForm.email,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = RegExp(pattern);
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'Formato de correo incorrecto';
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '*******',
                    labelText: 'Password',
                    prefixIcon: Icons.lock_outline),
                onChanged: (value) => loginForm.password,
                validator: (value) {
                  return (value != null && value.length >= 6)
                      ? null
                      : 'La contraseña es incorrecta o debe tener 6 caracteres';
                },
              ),
              const SizedBox(height: 30),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.deepPurple,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: const Text(
                      'Ingresar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    if (!loginForm.isValidForm()) return;
                    Navigator.pushReplacementNamed(context, 'home');
                  })
            ],
          )),
    );
  }
}
