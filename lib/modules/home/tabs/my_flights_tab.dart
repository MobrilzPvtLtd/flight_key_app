import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../shared/widgets/my_flights_cards.dart';
import '../controllers/my_flights_controller.dart';

class MyFlightsScreen extends StatelessWidget {
  MyFlightsScreen({super.key});

  final MyFlightsController controller =
  Get.put(MyFlightsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),

      body: Column(
        children: [
          _filterBar(context),
          Expanded(
            child: Obx(() {
              final flights = controller.filteredFlights;

              if (flights.isEmpty) {
                return const Center(
                  child: Text(
                    "No flights available",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: flights.length,
                itemBuilder: (_, index) {
                  final flight = flights[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Get.toNamed(
                        '/flight-details',
                        parameters: {
                          'flightId': flight.id.toString(), // or flight.flightNo
                        },
                      );
                    },
                    child: FlightCard(flight: flight),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  /// ================= FILTER BAR =================
  Widget _filterBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Obx(
            () => Row(
          children: [
            /// DATE CHIP
            _filterChip(
              icon: Icons.event,
              label: DateFormat('dd').format(
                controller.selectedDate.value,
              ),
              onTap: () => _pickDate(context),
            ),

            const SizedBox(width: 8),

            /// MONTH CHIP
            _filterChip(
              icon: Icons.calendar_view_month,
              label: DateFormat('MMM').format(
                controller.selectedDate.value,
              ),
              onTap: () => _pickDate(context),
            ),

            const SizedBox(width: 8),

            /// YEAR CHIP
            _filterChip(
              icon: Icons.date_range,
              label: DateFormat('yyyy').format(
                controller.selectedDate.value,
              ),
              onTap: () => _pickDate(context),
            ),

            const Spacer(),

            /// FULL CALENDAR ICON
            IconButton(
              icon: const Icon(Icons.calendar_month),
              onPressed: () => _pickDate(context),
            ),
          ],
        ),
      ),
    );
  }

  /// ================= DATE PICKER =================
  Future<void> _pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate.value,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      controller.changeDate(date);
    }
  }

  /// ================= FILTER CHIP =================
  Widget _filterChip({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F6F9),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: Colors.black54),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
