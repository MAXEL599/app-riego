import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  const RegistroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro Page'),
      ),
      body: const Center(
        child: Text('Welcome to the Registro Page!'),
      ),
    );
  }
}
