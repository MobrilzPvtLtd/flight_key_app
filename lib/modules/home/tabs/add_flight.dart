import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_flight_controller.dart';

class AddFlightScreen extends StatefulWidget {
  const AddFlightScreen({super.key});

  @override
  State<AddFlightScreen> createState() => _AddFlightScreenState();
}

class _AddFlightScreenState extends State<AddFlightScreen> {
  late final AddFlightController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AddFlightController());
  }

  @override
  void dispose() {
    Get.delete<AddFlightController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      body: Obx(() {
        return Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // FLIGHT INFORMATION Section
                  _sectionHeader('FLIGHT INFORMATION'),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _inputField("FLIGHT NUMBER", controller.flightNumber, "-----"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _inputField("FLIGHT REFERENCE", controller.flightReference, "Flight Reference"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _inputField("STARTING POINT", controller.startingPoint, "-----"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _inputField("DESTINATION", controller.destination, "-----"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _inputField("AIRCRAFT IDENTIFIER", controller.aircraftIdentifier, "Enter Reg Number"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _inputField("AIRCRAFT TYPE", controller.aircraftType, "Enter Aircraft Type"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _inputField("OPERATOR", controller.operator, "Optional"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _inputField("REMARKS", controller.remarks, "Remarks"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Date and Time Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: _dateInputField("DEPT. DATE", controller.departureDate),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _timeInputField("TIME", controller.departureTime),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _inputField("DUR...", controller.duration, "0.0"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: _dateInputField("ARRV. DATE", controller.arrivalDate),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _timeInputField("TIME", controller.arrivalTime),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  const Text(
                    "* Enter the departure time and arrival time in the local departure time zone. The system will adjust the arrival time if a change in time zone is present.",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),

                  const SizedBox(height: 24),

                  // DEPARTURE INFORMATION Section
                  _sectionHeader('DEPARTURE INFORMATION'),
                  const SizedBox(height: 12),
                  _inputField("HANDLER/FBO", controller.departureHandler, "Support Name"),
                  _inputField("ADDRESS 1", controller.departureAddress1, "Address 1"),
                  _inputField("ADDRESS 2", controller.departureAddress2, "Address 2"),
                  Row(
                    children: [
                      Expanded(
                        child: _inputField("CITY", controller.departureCity, "City"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _inputField("STATE", controller.departureState, "State"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _dropdownField("COUNTRY", controller.departureCountry, "SELECT Country"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _inputField("ZIP", controller.departureZip, "ZIP Code"),
                      ),
                    ],
                  ),
                  _inputField("SUPPORT NUMBER", controller.departureSupportNumber, "+000 000-000-0000"),

                  const SizedBox(height: 24),

                  // ARRIVAL INFORMATION Section
                  _sectionHeader('ARRIVAL INFORMATION'),
                  const SizedBox(height: 12),
                  _inputField("HANDLER/FBO", controller.arrivalHandler, "Support Name"),
                  _inputField("ADDRESS 1", controller.arrivalAddress1, "Address 1"),
                  _inputField("ADDRESS 2", controller.arrivalAddress2, "Address 2"),
                  Row(
                    children: [
                      Expanded(
                        child: _inputField("CITY", controller.arrivalCity, "City"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _inputField("STATE", controller.arrivalState, "State"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _dropdownField("COUNTRY", controller.arrivalCountry, "SELECT Country"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _inputField("ZIP", controller.arrivalZip, "ZIP Code"),
                      ),
                    ],
                  ),
                  _inputField("SUPPORT NUMBER", controller.arrivalSupportNumber, "+000 000-000-0000"),

                  const SizedBox(height: 24),

                  // FLIGHT GUESTS Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _sectionHeader('FLIGHT GUESTS'),
                      TextButton(
                        onPressed: () {
                          // Manage guests functionality
                        },
                        child: const Text(
                          'Manage Guests',
                          style: TextStyle(
                            color: Color(0xFF1b7bcd),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Display existing guests
                  Obx(() => Column(
                    children: controller.guests.asMap().entries.map((entry) {
                      int index = entry.key;
                      var guest = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _guestCard(
                          index: index,
                          email: guest.email,
                          firstName: guest.firstName,
                          role: guest.role,
                          fullActionsView: guest.fullActionsView,
                          statusBarAccess: guest.statusBarAccess,
                          overrideAccess: guest.overrideAccess,
                          autoInvite: guest.autoInvite,
                          onRemove: () => controller.removeGuest(index),
                          onRoleChanged: (newRole) => controller.updateGuestRole(index, newRole),
                          onPermissionChanged: (type, value) => controller.updateGuestPermission(index, type, value),
                        ),
                      );
                    }).toList(),
                  )),

                  // New guest form - shown when Add New Guest is clicked
                  Obx(() => controller.showGuestFields.value
                      ? Column(
                    children: [
                      _newGuestForm(),
                      const SizedBox(height: 12),
                    ],
                  )
                      : const SizedBox.shrink()),

                  // Add New Guest Button
                  Obx(() => OutlinedButton.icon(
                    onPressed: () => controller.toggleGuestFields(),
                    icon: Icon(
                      controller.showGuestFields.value ? Icons.close : Icons.add,
                      size: 20,
                    ),
                    label: Text(controller.showGuestFields.value ? 'Cancel' : 'Add New Guest'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF1b7bcd),
                      side: const BorderSide(color: Color(0xFF1b7bcd)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                  )),

                  const SizedBox(height: 12),

                  // Guest permissions info
                  // Container(
                  //   padding: const EdgeInsets.all(12),
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey[100],
                  //     borderRadius: BorderRadius.circular(8),
                  //     border: Border.all(color: Colors.grey[300]!),
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       _infoRow('Full Actions View:', 'View all actions assigned to every participant invited to this flight'),
                  //       _infoRow('Status Bar Access:', 'Ability to activate the actions for Ready, No Slot, Taxiing, Take off, Landing, Parking'),
                  //       _infoRow('Override Access:', 'Ability to complete other participants actions on this flight'),
                  //     ],
                  //   ),
                  // ),
                  //
                  // const SizedBox(height: 16),

                  // // Flight Key
                  // Container(
                  //   padding: const EdgeInsets.all(12),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(8),
                  //     border: Border.all(color: Colors.grey[300]!),
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       const Text(
                  //         'Flight Key',
                  //         style: TextStyle(
                  //           fontSize: 12,
                  //           color: Colors.black54,
                  //           fontWeight: FontWeight.w600,
                  //         ),
                  //       ),
                  //       const SizedBox(height: 4),
                  //       Text(
                  //         '+1 209 320 2222',
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //           color: Colors.grey[700],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  const SizedBox(height: 80),
                ],
              ),
            ),

            /// Loader overlay
            if (controller.isLoading.value)
              Container(
                color: Colors.black.withOpacity(0.2),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget _sectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1b7bcd),
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _inputField(String label, TextEditingController textController, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: textController,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Color(0xFF1b7bcd)),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateInputField(String label, TextEditingController textController) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: textController,
            readOnly: true,
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (date != null) {
                textController.text = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
              }
            },
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Color(0xFF1b7bcd)),
              ),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: const Icon(Icons.calendar_today, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _timeInputField(String label, TextEditingController textController) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: textController,
            readOnly: true,
            onTap: () async {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (time != null) {
                textController.text = "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
              }
            },
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Color(0xFF1b7bcd)),
              ),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: const Icon(Icons.access_time, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropdownField(String label, TextEditingController textController, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: textController,
            readOnly: true,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Color(0xFF1b7bcd)),
              ),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: const Icon(Icons.arrow_drop_down, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  Widget _newGuestForm() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF1b7bcd), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'New Guest Information',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1b7bcd),
            ),
          ),
          const SizedBox(height: 12),
          _inputField("Email", controller.guestEmail, "guest@example.com"),
          _inputField("First Name", controller.guestFirstName, "Enter first name"),

          // Role dropdown
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Role',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              Obx(() => DropdownButtonFormField<String>(
                value: controller.guestRole.value,
                items: ['Observer', 'Pilot', 'Co-Pilot', 'Crew'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(fontSize: 14)),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) controller.guestRole.value = value;
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: Color(0xFF1b7bcd)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              )),
            ],
          ),
          const SizedBox(height: 12),

          // Permissions checkboxes
          Obx(() => Column(
            children: [
              CheckboxListTile(
                title: const Text('Full Actions View', style: TextStyle(fontSize: 13)),
                value: controller.guestFullActionsView.value,
                onChanged: (value) => controller.guestFullActionsView.value = value ?? false,
                controlAffinity: ListTileControlAffinity.leading,
                dense: true,
                contentPadding: EdgeInsets.zero,
              ),
              CheckboxListTile(
                title: const Text('Status Bar Access', style: TextStyle(fontSize: 13)),
                value: controller.guestStatusBarAccess.value,
                onChanged: (value) => controller.guestStatusBarAccess.value = value ?? false,
                controlAffinity: ListTileControlAffinity.leading,
                dense: true,
                contentPadding: EdgeInsets.zero,
              ),
              CheckboxListTile(
                title: const Text('Override Access', style: TextStyle(fontSize: 13)),
                value: controller.guestOverrideAccess.value,
                onChanged: (value) => controller.guestOverrideAccess.value = value ?? false,
                controlAffinity: ListTileControlAffinity.leading,
                dense: true,
                contentPadding: EdgeInsets.zero,
              ),
              CheckboxListTile(
                title: const Text('Auto Invite', style: TextStyle(fontSize: 13)),
                value: controller.guestAutoInvite.value,
                onChanged: (value) => controller.guestAutoInvite.value = value ?? false,
                controlAffinity: ListTileControlAffinity.leading,
                dense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ],
          )),

          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.addGuest(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1b7bcd),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Add Guest', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _guestCard({
    required int index,
    required String email,
    required String firstName,
    required String role,
    required bool fullActionsView,
    required bool statusBarAccess,
    required bool overrideAccess,
    required bool autoInvite,
    required VoidCallback onRemove,
    required Function(String) onRoleChanged,
    required Function(String, bool) onPermissionChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'First Name',
                      style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      firstName,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Pending Invite',
                  style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Role dropdown
          DropdownButtonFormField<String>(
            value: role,
            items: ['Observer', 'Pilot', 'Co-Pilot', 'Crew'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: const TextStyle(fontSize: 14)),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) onRoleChanged(value);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Permissions in a wrap for better mobile layout
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              _permissionChip(
                'Full Actions View',
                fullActionsView,
                    (value) => onPermissionChanged('fullActionsView', value),
              ),
              _permissionChip(
                'Status Bar Access',
                statusBarAccess,
                    (value) => onPermissionChanged('statusBarAccess', value),
              ),
              _permissionChip(
                'Override Access',
                overrideAccess,
                    (value) => onPermissionChanged('overrideAccess', value),
              ),
              _permissionChip(
                'Auto Invite',
                autoInvite,
                    (value) => onPermissionChanged('autoInvite', value),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Remove button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onRemove,
              icon: const Icon(Icons.delete_outline, size: 18),
              label: const Text('Remove Guest'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _permissionChip(String label, bool value, Function(bool) onChanged) {
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: value ? Colors.white : Colors.black87,
        ),
      ),
      selected: value,
      onSelected: onChanged,
      selectedColor: const Color(0xFF1b7bcd),
      checkmarkColor: Colors.white,
      backgroundColor: Colors.grey[200],
      padding: const EdgeInsets.symmetric(horizontal: 4),
    );
  }

  Widget _infoRow(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• $title ',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}