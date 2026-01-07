import 'package:flutter/material.dart';

class PaymentInfoScreen extends StatelessWidget {
  const PaymentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Info'),
        centerTitle: true,
        backgroundColor: const Color(0xFF0A66C2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// SELECTED PRODUCT
            _sectionTitle('Selected Product'),
            _infoRow('Single Flight', '\$24.99'),

            const SizedBox(height: 12),

            /// PROMO CODE
            const Text('Enter Promo Code'),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: _textField('Promo code'),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A66C2),
                    ),
                    child: const Text('APPLY'),
                  ),
                )
              ],
            ),

            const SizedBox(height: 20),
            _divider(),

            /// CARD DETAILS
            _sectionTitle('Card Details'),
            _textField('Card Holder Name'),
            const SizedBox(height: 12),

            _dropdownField('Credit Card Type', [
              'Visa',
              'MasterCard',
              'American Express',
              'Discover'
            ]),

            const SizedBox(height: 12),
            _textField('Credit Card Number'),

            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _dropdownField('Month', ['01','02','03','04'])),
                const SizedBox(width: 12),
                Expanded(child: _dropdownField('Year', ['2025','2026','2027'])),
                const SizedBox(width: 12),
                Expanded(child: _textField('CVV')),
              ],
            ),

            const SizedBox(height: 20),
            _divider(),

            /// BILLING ADDRESS
            _sectionTitle('Billing Address'),
            _textField('Address'),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: _textField('City')),
                const SizedBox(width: 12),
                Expanded(child: _textField('State')),
              ],
            ),

            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _textField('Zip Code')),
                const SizedBox(width: 12),
                Expanded(
                  child: _dropdownField('Country', ['USA', 'India']),
                ),
              ],
            ),

            const SizedBox(height: 12),
            _textField('Phone Number'),

            const SizedBox(height: 20),
            _divider(),

            /// AMOUNT
            _sectionTitle('Amount'),
            _textField('\$24.99', enabled: false),

            const SizedBox(height: 12),

            Row(
              children: const [
                Checkbox(value: true, onChanged: null),
                Expanded(
                  child: Text(
                    'Keep credit card information on file for future use',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// PAY BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A66C2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Pay',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// ---------------- WIDGETS ----------------

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _infoRow(String left, String right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(left),
        Text(
          right,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _textField(String hint, {bool enabled = true}) {
    return TextField(
      enabled: enabled,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _dropdownField(String hint, List<String> items) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (_) {},
    );
  }

  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Divider(color: Colors.grey.shade300),
    );
  }
}
