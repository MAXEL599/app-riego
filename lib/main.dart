import 'package:flutter/material.dart';
import 'principal.dart';
import 'registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget es la raíz de tu aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonDisabled = true;
  bool _isPasswordVisible = false;
  bool _rememberUsername = false;

  // Función para manejar el inicio de sesión
  void _login() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PrincipalPage()),
    );
  }

  // Función para manejar el registro
  void _register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegistroPage()),
    );
  }

  // Función para validar los campos de entrada
  void _validateInputs() {
    setState(() {
      _isButtonDisabled =
          _usernameController.text.isEmpty || _passwordController.text.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_validateInputs);
    _passwordController.addListener(_validateInputs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Campo de texto para el nombre de usuario
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
              style: const TextStyle(fontFamily: 'Arial', fontSize: 16),
            ),
            // Campo de texto para la contraseña
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              obscureText: !_isPasswordVisible,
              style: const TextStyle(fontFamily: 'Arial', fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // Checkbox para recordar el nombre de usuario
                    Checkbox(
                      value: _rememberUsername,
                      onChanged: (bool? value) {
                        setState(() {
                          _rememberUsername = value ?? false;
                        });
                      },
                    ),
                    const Text(
                      'Remember Username',
                      style: TextStyle(fontFamily: 'Arial', fontSize: 16),
                    ),
                  ],
                ),
                // Botón para registrarse
                ElevatedButton(
                  onPressed: _register,
                  child: const Text(
                    'Register',
                    style: TextStyle(fontFamily: 'Arial', fontSize: 16),
                  ),
                ),
                // Botón para aceptar (iniciar sesión)
                ElevatedButton(
                  onPressed: _isButtonDisabled ? null : _login,
                  child: const Text(
                    'Accept',
                    style: TextStyle(fontFamily: 'Arial', fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
