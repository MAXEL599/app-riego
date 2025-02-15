import 'package:flutter/material.dart';

class ConfiguracionPage extends StatefulWidget {
  const ConfiguracionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ConfiguracionPageState createState() => _ConfiguracionPageState();
}

class _ConfiguracionPageState extends State<ConfiguracionPage> {
  String _selectedPlant = 'Tomate';
  double _waterAmount = 0.0;
  bool _valveStatus1 = false;
  bool _valveStatus2 = false;
  bool _valveStatus3 = false;
  bool _valveStatus4 = false;
  bool _valveStatus5 = false;
  bool _allValvesStatus = false;
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _toggleAllValves(bool value) {
    setState(() {
      _allValvesStatus = value;
      _valveStatus1 = value;
      _valveStatus2 = value;
      _valveStatus3 = value;
      _valveStatus4 = value;
      _valveStatus5 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de Arduino'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Selección de planta
            const Text(
              'Seleccionar Planta:',
              style: TextStyle(fontFamily: 'Arial', fontSize: 16),
            ),
            DropdownButton<String>(
              value: _selectedPlant,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPlant = newValue!;
                });
              },
              items: <String>['Tomate', 'Lechuga', 'Pepino', 'Fresa']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Cantidad de agua
            const Text(
              'Cantidad de Agua (litros):',
              style: TextStyle(fontFamily: 'Arial', fontSize: 16),
            ),
            Slider(
              value: _waterAmount,
              min: 0,
              max: 10,
              divisions: 20,
              label: _waterAmount.toString(),
              onChanged: (double value) {
                setState(() {
                  _waterAmount = value;
                });
              },
            ),
            const SizedBox(height: 20),
            // Control de electroválvulas individuales
            const Text(
              'Control de Electroválvulas:',
              style: TextStyle(fontFamily: 'Arial', fontSize: 16),
            ),
            SwitchListTile(
              title: const Text('Electroválvula 1'),
              value: _valveStatus1,
              onChanged: (bool value) {
                setState(() {
                  _valveStatus1 = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Electroválvula 2'),
              value: _valveStatus2,
              onChanged: (bool value) {
                setState(() {
                  _valveStatus2 = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Electroválvula 3'),
              value: _valveStatus3,
              onChanged: (bool value) {
                setState(() {
                  _valveStatus3 = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Electroválvula 4'),
              value: _valveStatus4,
              onChanged: (bool value) {
                setState(() {
                  _valveStatus4 = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Electroválvula 5'),
              value: _valveStatus5,
              onChanged: (bool value) {
                setState(() {
                  _valveStatus5 = value;
                });
              },
            ),
            const SizedBox(height: 20),
            // Control de todas las electroválvulas
            const Text(
              'Control de Todas las Electroválvulas:',
              style: TextStyle(fontFamily: 'Arial', fontSize: 16),
            ),
            SwitchListTile(
              title: const Text('Abrir/Cerrar Todas las Electroválvulas'),
              value: _allValvesStatus,
              onChanged: _toggleAllValves,
            ),
            const SizedBox(height: 20),
            // Configuración de horarios de riego
            const Text(
              'Configurar Horarios de Riego:',
              style: TextStyle(fontFamily: 'Arial', fontSize: 16),
            ),
            ListTile(
              title: const Text('Hora de Riego'),
              subtitle: Text(_selectedTime.format(context)),
              trailing: const Icon(Icons.access_time),
              onTap: () => _selectTime(context),
            ),
            const SizedBox(height: 20),
            // Botón para guardar configuración
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para guardar la configuración
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text(
                  'Guardar Configuración',
                  style: TextStyle(fontFamily: 'Arial', fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
