import 'package:flutter/material.dart';

class FlightsTab extends StatelessWidget {
  const FlightsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          leading: const Icon(Icons.flight_takeoff),
          title: Text('Flight #${index + 1}'),
          subtitle: const Text('Departure → Arrival'),
        ),
      ),
    );
  }
}
