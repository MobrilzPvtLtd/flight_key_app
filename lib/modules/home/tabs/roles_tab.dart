import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/roles_controller.dart';

class RolesTab extends StatefulWidget {
  const RolesTab({super.key});

  @override
  State<RolesTab> createState() => _RolesTabState();
}

class _RolesTabState extends State<RolesTab> {
  final RolesController controller = Get.put(RolesController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// TITLE
            const Center(
              child: Text(
                'Manage Roles & Actions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// ROLE INFORMATION
            _sectionTitle('ROLE INFORMATION'),
            const SizedBox(height: 10),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        /// ROLE DROPDOWN
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: _inputDecoration('Role'),
                            items: const [
                              DropdownMenuItem(
                                value: 'new',
                                child: Text('Create New Role'),
                              ),
                            ],
                            onChanged: (_) {},
                          ),
                        ),
                        const SizedBox(width: 16),

                        /// ROLE NAME
                        Expanded(
                          child: TextFormField(
                            decoration: _inputDecoration('Role Name'),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// PRIVATE + PASSENGER ROLE
                    Row(
                      children: [
                        const Text('Private'),
                        const SizedBox(width: 10),
                        Switch(
                          value: false,
                          onChanged: (_) {},
                        ),
                        const SizedBox(width: 20),
                        Checkbox(
                          value: false,
                          onChanged: (_) {},
                        ),
                        const Text('Passenger Role'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// ROLE ACTIONS
            _sectionTitle('ROLE ACTIONS'),
            const SizedBox(height: 10),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1b7bcd),
              ),
              onPressed: controller.toggleActionForm,
              child: const Text('Add New Action'),
            ),


            const SizedBox(height: 40),

            /// EMPTY STATE
            Center(
              child: Column(
                children: const [
                  Text(
                    'You may recall a previously used action list, use and modify\n'
                        'one of our templates, or create a new action list from scratch',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),

            /// FOOTER BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Delete Role'),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1b7bcd),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Save Role'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// SECTION TITLE
  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  /// INPUT DECORATION
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
