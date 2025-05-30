import 'package:flutter/material.dart';

class ConversionHistory extends StatelessWidget {
  final List<String> history;

  const ConversionHistory({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Conversion History:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: history.isEmpty
                  ? const Center(child: Text("No conversions yet."))
                  : ListView.builder(
                      itemCount: history.length,
                      itemBuilder: (context, index) {
                        return Text(
                          history[index],
                          style: const TextStyle(fontSize: 14),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}