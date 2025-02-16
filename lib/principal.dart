import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'configuracion.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  bool _isDarkMode = false;
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  void _toggleTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = value;
      prefs.setBool('isDarkMode', value);
    });
  }

  void _connectToArduino() {
    // Lógica para conectarse al Arduino por WiFi o Bluetooth
    setState(() {
      _isConnected = true;
    });
  }

  void _goToConfiguracion() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ConfiguracionPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Principal Page'),
      ),
      body: Column(
        children: <Widget>[
          // Menú visible en la ventana principal
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Lógica para perfil de usuario
                  },
                  child: const Text('Perfil de Usuario'),
                ),
                ElevatedButton(
                  onPressed: _connectToArduino,
                  child: const Text('Conectar Arduino'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para abrir el apartado de manual
                  },
                  child: const Text('Manual'),
                ),
                Row(
                  children: <Widget>[
                    const Text('Modo Oscuro'),
                    Switch(
                      value: _isDarkMode,
                      onChanged: _toggleTheme,
                      activeColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Welcome to the Principal Page!'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _isConnected ? _goToConfiguracion : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Ir a Configuración',
                      style: TextStyle(fontFamily: 'Arial', fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
