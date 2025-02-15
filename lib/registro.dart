// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'principal.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register() {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PrincipalPage()),
      );
    } else {
      // Mostrar un mensaje de error o alerta
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, complete todos los campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Campo de texto para el nombre
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
              ),
              style: const TextStyle(fontFamily: 'Arial', fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Campo de texto para el correo
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Correo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
              ),
              style: const TextStyle(fontFamily: 'Arial', fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Campo de texto para la contraseña
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
              ),
              obscureText: true,
              style: const TextStyle(fontFamily: 'Arial', fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Botones para registrarse con Facebook, GitHub y Google
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    // Lógica para registrarse con Facebook
                  },
                  icon: const FaIcon(FontAwesomeIcons.facebook),
                  label: const Text(
                    'Facebook',
                    style: TextStyle(fontFamily: 'Arial', fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Lógica para registrarse con GitHub
                  },
                  icon: const FaIcon(FontAwesomeIcons.github),
                  label: const Text(
                    'GitHub',
                    style: TextStyle(fontFamily: 'Arial', fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Lógica para registrarse con Google
                  },
                  icon: const FaIcon(FontAwesomeIcons.google),
                  label: const Text(
                    'Google',
                    style: TextStyle(fontFamily: 'Arial', fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Botón para aceptar el registro
            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Aceptar',
                style: TextStyle(fontFamily: 'Arial', fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
