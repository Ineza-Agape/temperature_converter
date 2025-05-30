import 'package:flutter/material.dart';
import 'widgets/conversion_history.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key}); 
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum ConversionType { fahrenheitToCelsius, celsiusToFahrenheit }

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  ConversionType _selectedConversion = ConversionType.fahrenheitToCelsius;
  String _convertedValue = '';
  final List<String> _history = [];

  void _convertTemperature() {
    double? input = double.tryParse(_controller.text);

    if (input == null) {
      setState(() {
        _convertedValue = 'Invalid input';
      });
      return;
    }

    double result;
    String historyEntry;

    if (_selectedConversion == ConversionType.fahrenheitToCelsius) {
      result = (input - 32) * 5 / 9;
      historyEntry = 'F to C: ${input.toStringAsFixed(1)} ➔ ${result.toStringAsFixed(2)}';
    } else {
      result = (input * 9 / 5) + 32;
      historyEntry = 'C to F: ${input.toStringAsFixed(1)} ➔ ${result.toStringAsFixed(2)}';
    }

    setState(() {
      _convertedValue = result.toStringAsFixed(2);
      _history.insert(0, historyEntry); // Add to top
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPortrait = size.height > size.width;
    final isTablet = size.shortestSide >= 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 64.0 : 16.0,
          vertical: isTablet ? 32.0 : 16.0,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isTablet ? 600 : double.infinity,
            ),
            child: isPortrait ? _buildPortraitLayout() : _buildLandscapeLayout(),
          ),
        ),
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      children: _buildCommonWidgets(),
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: _buildCommonWidgets(),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildCommonWidgets() {
    return [
      Row(
        children: [
          Expanded(
            child: ListTile(
              title: const Text('Fahrenheit to Celsius'),
              leading: Radio(
                value: ConversionType.fahrenheitToCelsius,
                groupValue: _selectedConversion,
                onChanged: (ConversionType? value) {
                  setState(() {
                    _selectedConversion = value!;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: const Text('Celsius to Fahrenheit'),
              leading: Radio(
                value: ConversionType.celsiusToFahrenheit,
                groupValue: _selectedConversion,
                onChanged: (ConversionType? value) {
                  setState(() {
                    _selectedConversion = value!;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Enter Temperature',
              ),
            ),
          ),
          SizedBox(width: 10),
          Text('='),
          SizedBox(width: 10),
          Text(
            _convertedValue,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      SizedBox(height: 10),
      ElevatedButton(
        onPressed: _convertTemperature,
        child: Text('CONVERT'),
      ),
      SizedBox(height: 20),
      Expanded(
        child: ConversionHistory(history: _history),
      ),
    ];
  }
}