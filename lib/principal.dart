import 'package:flutter/material.dart';

class PrincipalPage extends StatelessWidget {
  const PrincipalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Principal Page'),
      ),
      body: const Center(
        child: Text('Welcome to the Principal Page!'),
      ),
    );
  }
}
