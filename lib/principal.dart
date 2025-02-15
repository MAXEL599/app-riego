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
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String value) {
              switch (value) {
                case 'Perfil de Usuario':
                  // Lógica para perfil de usuario
                  break;
                case 'Conectar Arduino':
                  _connectToArduino();
                  break;
                case 'Manual':
                  // Lógica para abrir el apartado de manual
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Perfil de Usuario', 'Conectar Arduino', 'Manual'}
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
          Switch(
            value: _isDarkMode,
            onChanged: _toggleTheme,
            activeColor: Colors.white,
          ),
        ],
      ),
      body: Center(
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
    );
  }
}
