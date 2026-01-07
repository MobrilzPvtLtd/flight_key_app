import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/flight_detail_controller.dart';

class FlightDetailsScreen extends StatelessWidget {
  FlightDetailsScreen({super.key});

  final FlightDetailsController controller =
  Get.put(FlightDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B7BCD),
        title: const Text(
          "965896",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _statusRow(),
            const SizedBox(height: 16),
            _routeCard(),
            const SizedBox(height: 16),
            _tripNotes(),
            const SizedBox(height: 16),
            _delayNotifications(),
            const SizedBox(height: 20),
            _actionsCompleted(),
            const SizedBox(height: 20),
            _participantsList(),
          ],
        ),
      ),
    );
  }

  // ================= STATUS ROW =================

  Widget _statusRow() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: const [
        _StatusChip(label: "READY", color: Colors.green),
        _StatusChip(label: "TAXI", color: Colors.red),
        _StatusChip(label: "NO SLOT", color: Colors.green),
        _StatusChip(label: "TAKE OFF", color: Colors.red),
        _StatusChip(label: "LANDED", color: Colors.red),
        _StatusChip(label: "PARKED", color: Colors.red),
      ],
    );
  }

  // ================= ROUTE CARD =================

  Widget _routeCard() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _airportBlock(
              city: "NEW YORK, NY, US",
              code: "KJFK",
              time: "10:00 AM EST\nDec 31, 2025",
            ),
            Expanded(
              child: Column(
                children: const [
                  Icon(Icons.flight_takeoff, color: Colors.grey),
                  SizedBox(height: 4),
                  Text("07h 13m • 2989 NM",
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            _airportBlock(
              city: "LONDON, EG, GB",
              code: "EGLL",
              time: "10:13 PM GMT\nDec 31, 2025",
            ),
          ],
        ),
      ),
    );
  }

  Widget _airportBlock({
    required String city,
    required String code,
    required String time,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(city,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(code,
            style: const TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(time,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  // ================= TRIP NOTES =================

  Widget _tripNotes() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "TRIP NOTES",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B7BCD)),
            ),
            SizedBox(height: 8),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Enter trip notes...",
                border: OutlineInputBorder(),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ================= DELAY NOTIFICATIONS =================

  Widget _delayNotifications() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "DELAY NOTIFICATIONS",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B7BCD)),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: const [
            _FilterChip(label: "TFR"),
            _FilterChip(label: "WEATHER"),
            _FilterChip(label: "NOTAMS"),
            _FilterChip(label: "PASSENGERS"),
            _FilterChip(label: "AIRCRAFT"),
          ],
        ),
      ],
    );
  }


  Widget _actionsCompleted() {
    return Obx(() {
      final completed =
          controller.actions.where((e) => e.completed).length;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ACTIONS COMPLETED $completed / ${controller.actions.length}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B7BCD),
            ),
          ),
          const SizedBox(height: 12),
          ...List.generate(
            controller.actions.length,
                (index) {
              final action = controller.actions[index];
              final isDone = action.completed;

              return InkWell(
                onTap: () => controller.toggleAction(index),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDone ? Colors.green : Colors.red,
                      width: 1.2,
                    ),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 4),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          color: isDone ? Colors.green : Colors.transparent,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: isDone ? Colors.green : Colors.red,
                            width: 2,
                          ),
                        ),
                        child: isDone
                            ? const Icon(Icons.check,
                            size: 14, color: Colors.white)
                            : null,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              action.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color:
                                isDone ? Colors.green : Colors.red,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              action.assignedTo,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      if (isDone)
                        Text(
                          "${action.completedAt!.hour.toString().padLeft(2, '0')}:"
                              "${action.completedAt!.minute.toString().padLeft(2, '0')}",
                          style: const TextStyle(fontSize: 12),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      );
    });
  }

  // ================= PARTICIPANTS =================

  Widget _participantsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "PARTICIPANTS LIST (2)",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B7BCD)),
        ),
        const SizedBox(height: 12),
        _participantTile("Thibault Delassus", "Cockpit"),
        _participantTile("Kumar Kumar", "Operations"),
      ],
    );
  }

  Widget _participantTile(String name, String role) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(name),
        subtitle: Text(role),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            "ACCEPTED",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}

// ================= REUSABLE =================

class _StatusChip extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;

  const _FilterChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Text(label),
    );
  }
}
