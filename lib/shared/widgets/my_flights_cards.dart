import 'package:flutter/material.dart';
import '../../data/models/my_fights_modal.dart';

class FlightCard extends StatelessWidget {
  final FlightModel flight;

  const FlightCard({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: flight.isReady ? Colors.green : Colors.red,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(14),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  flight.status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  flight.flightNo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          /// BODY
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _location(
                  title: flight.fromCode,
                  subtitle: flight.fromCity,
                  alignEnd: false,
                ),

                Expanded(
                  child: Column(
                    children: const [
                      Icon(Icons.flight_takeoff,
                          color: Colors.grey),
                      SizedBox(height: 6),
                      Divider(thickness: 1),
                    ],
                  ),
                ),

                _location(
                  title: flight.toCode,
                  subtitle: flight.toCity,
                  alignEnd: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _location({
    required String title,
    required String subtitle,
    required bool alignEnd,
  }) {
    return Column(
      crossAxisAlignment:
      alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
